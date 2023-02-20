package com.example.casestudy3.controller;

import com.example.casestudy3.model.Customer;
import com.example.casestudy3.model.CustomerType;
import com.example.casestudy3.service.jdbc.CustomerService;
import com.example.casestudy3.service.jdbc.CustomerTypeService;
import com.example.casestudy3.service.ICustomerService;
import com.example.casestudy3.service.ICustomerTypeService;
import com.example.casestudy3.utils.DateUtils;
import com.example.casestudy3.utils.ValidateUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customers"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class CustomerServlet extends HttpServlet {
    private ICustomerService iCustomerService;
    private ICustomerTypeService iCustomerTypeService;

    @Override
    public void init() throws ServletException {
        iCustomerService = new CustomerService();
        iCustomerTypeService = new CustomerTypeService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Đương dẫn chứa web ở server");
        String appRealPath = getServletContext().getRealPath("/");
        System.out.println(appRealPath);
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateCustomers(req, resp);
                break;
            case "edit":
                showEditCustomers(req, resp);
                break;
            default:
                showCustomers(req, resp);
        }
    }

    private void showEditCustomers(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
        int id = Integer.parseInt(req.getParameter("id"));
        Customer customer = iCustomerService.findCustomerById((long) id);

        if (customer == null) {
            resp.sendRedirect("/customers?message=edit");
        }else{

            req.setAttribute("customer", customer);
            req.setAttribute("customerTypes", customerTypes);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher( "/customer/edit.jsp");
            requestDispatcher.forward(req, resp);
        }
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(req, resp);
                break;
            case "delete":
                deleteCustomer(req, resp);
                break;
            case "edit":
                editCustomer(req, resp);
                break;
        }
    }

    private void editCustomer(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        List<String> errors = new ArrayList<>();
        Customer customer = new Customer();

        isValidName(req, customer, errors);
        isValidAddress(req, customer, errors);
        isValidCustomerType(req, customer, errors);
        Part part = isValidImage(req, customer, errors);
        String sCreatedAt = req.getParameter("createdAt");
        Date createAt = DateUtils.formatDate(sCreatedAt);
        customer.setCreateAt(createAt);
        List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
        req.setAttribute("customerTypes", customerTypes);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/customer/edit.jsp");
        if(errors.size() == 0){
            long id = Long.parseLong(req.getParameter("id"));
            customer.setId(id);
            Customer customerDB = iCustomerService.findCustomerById(customer.getId());
            if ( customer.getImage()!=null) {
                if(customerDB.getImage() != null && !customerDB.getImage().equals(customer.getImage()) && part != null){
                    handleEditImageUploadAdvanced(part);
                }
            }
            iCustomerService.editCustomer(customer);
            resp.sendRedirect("/customers");
        } else {
            req.setAttribute("errors", errors);
            req.setAttribute("customer", customer);
            requestDispatcher.forward(req, resp);
        }
    }

    private void handleEditImageUploadAdvanced(Part part) throws IOException {
        String fileName = extractFileName(part);
        String appRealPath = getServletContext().getRealPath("/") + "images";
        File file = new File(appRealPath);
        if (!file.exists()) {
            file.mkdir();
        }
        String nameFileServer = appRealPath + File.separator + fileName;
        System.out.println("Name file server: " + nameFileServer);
        part.write(nameFileServer);
        String nameFileProject = "E:\\Module3\\casestudy3\\src\\main\\webapp\\images" + File.separator + fileName;
        System.out.println("Name file project: " + nameFileProject);
        part.write(nameFileProject);
    }

    private void deleteCustomer(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Long id = Long.parseLong(req.getParameter("idDelete"));
        iCustomerService.deleteCustomerById(id);

        resp.sendRedirect("/customers?message=delete");
    }

    private void createCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        Customer customer = new Customer();
        Long id = System.currentTimeMillis()/10000;
        customer.setId(id);
        isValidName(req, customer, errors);
        isValidAddress(req, customer, errors);
        isValidCustomerType(req, customer, errors);
        isValidImage(req, customer, errors);
        String sCreatedAt = req.getParameter("createdAt");
        Date createAt = DateUtils.formatDate(sCreatedAt);
        customer.setCreateAt(createAt);
        List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
        req.setAttribute("customerTypes", customerTypes);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/customer/create.jsp");
        if (errors.size() == 0) {
            handleImageUpload(req, customer, errors);
            req.setAttribute("message", "Them thanh cong");
            iCustomerService.createCustomer(customer);
            requestDispatcher.forward(req, resp);
        }else{
            req.setAttribute("errors", errors);
            req.setAttribute("customer", customer);
            requestDispatcher.forward(req, resp);
        }
    }

    private Part isValidImage(HttpServletRequest req, Customer customer, List<String> errors) throws ServletException, IOException {
        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);
            customer.setImage(fileName);
            if(!fileName.equals("")){
                boolean check = iCustomerService.checkImageExists(fileName);
                if (check == true) {
                    return null;
                }else {
                    return part;
                }
            }
        }
        return null;
    }

    private void isValidCustomerType(HttpServletRequest req, Customer customer, List<String> errors) {
        try {
            int idCustomerType = Integer.parseInt(req.getParameter("sCustomerType"));
            if (iCustomerTypeService.getCustomerTypeById(idCustomerType)!=null) {
                customer.setIdType(idCustomerType);
            }else{
                errors.add("Loại khách hàng chưa hợp lệ");
            }
        } catch (NumberFormatException numberFormatException) {
            errors.add("Định dạng loại khách hàng chưa đúng");
        }
    }

    private void isValidAddress(HttpServletRequest req, Customer customer, List<String> errors) {
        String address = req.getParameter("address");
        if (!ValidateUtils.isAddressValid(address)) {
            errors.add("Địa chỉ không hợp lệ. Chỉ chứa từ từ 5-15 kí và bắt đầu A-Za-z0-9");
        }
        customer.setAddress(address);
    }

    private void handleImageUpload(HttpServletRequest req, Customer customer, List<String> errors) throws ServletException, IOException {
        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);
            // chỉnh tên tệp trong trường hợp đó là một đường dẫn tuyệt đối
            if(!fileName.equals("")){
                String appRealPath = getServletContext().getRealPath("/") + "images";
                File file = new File(appRealPath);
                if (!file.exists()) {
                    file.mkdir();
                }
                String nameFileServer = appRealPath + File.separator + fileName;
                System.out.println("Name file server: " + nameFileServer);
                part.write(nameFileServer);
                String nameFileProject = "E:\\Module3\\casestudy3\\src\\main\\webapp\\images" + File.separator + fileName;
                System.out.println("Name file project: " + nameFileProject);
                part.write(nameFileProject);

                customer.setImage(fileName);
            }
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    private void isValidName(HttpServletRequest req, Customer customer, List<String> errors) {
        String name = req.getParameter("name");
        if (!ValidateUtils.isNameValid(name)) {
            errors.add("Tên không hợp lệ. Chỉ chứa từ từ 4-14 kí và bắt đầu A-Za-z0-9");
        }
        customer.setName(name);
    }

    private void showCreateCustomers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
        req.setAttribute("customerTypes", customerTypes);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/customer/create.jsp");
        requestDispatcher.forward(req, resp);
    }
        private void showCustomers (HttpServletRequest req, HttpServletResponse resp) throws
        ServletException, IOException {
            String kw = "";
            if (req.getParameter("kw") != null) {
                kw = req.getParameter("kw");
            }
            int idCustomerType = -1;
            if (req.getParameter("ct") != null && !req.getParameter("ct").equals("")) {
                idCustomerType = Integer.parseInt(req.getParameter("ct"));
            }
            int page = 1;
            if (req.getParameter("page") != null && !req.getParameter("page").equals("")) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            int limit = 2;
            if (req.getParameter("limit") != null && !req.getParameter("limit").equals("")) {
                limit = Integer.parseInt(req.getParameter("limit"));
            }
            List<Customer> customer = iCustomerService.getAllCustomerSearchingPaging(kw,idCustomerType,  (page-1)*limit, limit);
            List<CustomerType> customerTypes = iCustomerTypeService.getAllCustomerTypes();
            int noOfRecords = iCustomerService.getNoOfRecords();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / limit);
            req.setAttribute("customer", customer);
            req.setAttribute("customerTypes", customerTypes);
            req.setAttribute("kw", kw);
            req.setAttribute("ct", idCustomerType);

            req.setAttribute("currentPage", page);
            req.setAttribute("noOfPages", noOfPages);

            String message = req.getParameter("message");
            if (message != null) {
                req.setAttribute("message", message);
            }
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/customer/customer.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
