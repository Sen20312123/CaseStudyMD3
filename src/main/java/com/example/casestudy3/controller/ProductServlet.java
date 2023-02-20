package com.example.casestudy3.controller;

import com.example.casestudy3.model.Category;
import com.example.casestudy3.model.Customer;
import com.example.casestudy3.model.CustomerType;
import com.example.casestudy3.model.Product;
import com.example.casestudy3.service.jdbc.CategoryService;
import com.example.casestudy3.service.ICategoryService;
import com.example.casestudy3.service.IProductService;
import com.example.casestudy3.service.jdbc.ProductService;
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

@WebServlet(name = "ProductServlet", urlPatterns = {"/products"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductServlet extends HttpServlet {

    private IProductService iProductService;
    private ICategoryService iCategoryService;

    @Override
    public void init() throws ServletException {
        iProductService = new ProductService();
        iCategoryService = new CategoryService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateProduct(req , resp);
                break;
            case "edit":
                showEditProduct(req , resp);
                break;
            default:
                showProduct(req , resp);
        }
    }

    private void showEditProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = iCategoryService.getAllCategory();
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = iProductService.findProductById( (long)id);

        if (product == null) {
            resp.sendRedirect("/products?message=edit");
        }else{

            req.setAttribute("product", product);
            req.setAttribute("categories", categories);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher( "/product/edit.jsp");
            requestDispatcher.forward(req, resp);
        }
    }

    private void showCreateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = iCategoryService.getAllCategory();
        req.setAttribute("categories", categories);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/product/create.jsp");
        requestDispatcher.forward(req, resp);
    }


    private void showProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String kw = "";
        if (req.getParameter("kw") != null) {
            kw = req.getParameter("kw");
        }
        int idCategory = -1;
        if (req.getParameter("ct") != null && !req.getParameter("ct").equals("")) {
            idCategory = Integer.parseInt(req.getParameter("ct"));
        }
        int page = 1;
        if (req.getParameter("page") != null && !req.getParameter("page").equals("")) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        int limit = 5;
        if (req.getParameter("limit") != null && !req.getParameter("limit").equals("")) {
            limit = Integer.parseInt(req.getParameter("limit"));
        }
        List<Product> products = iProductService.getAllProductSearchingPaging(kw,idCategory,  (page-1)*limit, limit);
        List<Category> categories = iCategoryService.getAllCategory();
        int noOfRecords = iProductService.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / limit);
        req.setAttribute("products", products);
        req.setAttribute("categories" , categories);
        req.setAttribute("kw", kw);
        req.setAttribute("ct", idCategory);

        req.setAttribute("currentPage", page);
        req.setAttribute("noOfPages", noOfPages);

        String message = req.getParameter("message");
        if (message != null) {
            req.setAttribute("message", message );
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/product/product.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                createProduct(req , resp);
                break;
            case "delete":
                deleteProduct(req ,resp);
                break;
            case "edit":
                editProduct(req , resp);
                break;
            
        }
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        Product product = new Product();
        isValidName(req, product, errors);
        isValidDescription(req , product ,errors);
        isValidCategory(req, product, errors);
        Part part = isValidImage(req, product, errors);
        int price = Integer.parseInt(req.getParameter("price"));
        product.setPrice(price);
        int quantity = Integer.parseInt( req.getParameter("quantity"));
        product.setQuantity(quantity);
        List<Category> categories = iCategoryService.getAllCategory();
        req.setAttribute("categories", categories);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/product/edit.jsp");
        if(errors.size() == 0){
            long id = Long.parseLong(req.getParameter("id"));
            product.setId(id);
            Product productDB = iProductService.findProductById(product.getId());
            if ( product.getImage()!=null) {
                if(productDB.getImage() != null && !productDB.getImage().equals(product.getImage()) && part != null){
                    handleEditImageUploadAdvanced(part);
                }
            }
            iProductService.editProduct(product);
            resp.sendRedirect("/products");
        } else {
            req.setAttribute("errors", errors);
            req.setAttribute("product", product);
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

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Long id = Long.parseLong(req.getParameter("idDelete"));
        iProductService.deleteProductById(id);

        resp.sendRedirect("/products?message=delete");
    }
    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        Product product = new Product();
        isValidName(req, product, errors);
        isValidDescription(req , product ,errors);
        isValidCategory(req, product, errors);
        isValidImage(req, product, errors);
        int price = Integer.parseInt(req.getParameter("price"));
        product.setPrice(price);
        int quantity = Integer.parseInt( req.getParameter("quantity"));
        product.setQuantity(quantity);
        List<Category> categories = iCategoryService.getAllCategory();
        req.setAttribute("categories", categories);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/product/create.jsp");
        if (errors.size() == 0) {
            handleImageUpload(req, product, errors);
            req.setAttribute("message", "Them thanh cong");
            iProductService.createProduct(product);
//            resp.sendRedirect("/products");
            requestDispatcher.forward(req, resp);
        }else{
            req.setAttribute("errors", errors);
            req.setAttribute("product", product);
            requestDispatcher.forward(req, resp);
        }
    }


    private void isValidDescription(HttpServletRequest req, Product product, List<String> errors) {
        String description = req.getParameter("description");
        if (!ValidateUtils.isNameValid(description)) {
            errors.add("Mô tả không hợp lệ. Chỉ chứa từ từ 4-14 kí và bắt đầu A-Za-z0-9");
        }
        product.setDescription(description);
    }

    private Part isValidImage(HttpServletRequest req, Product product, List<String> errors) throws ServletException, IOException {
        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);
            product.setImage(fileName);
            if(!fileName.equals("")){
                boolean check = iProductService.checkImageExists(fileName);
                if (check == true) {
                    return null;
                }else {
                    return part;
                }
            }
        }
        return null;
    }

    private void handleImageUpload(HttpServletRequest req, Product product, List<String> errors) throws IOException, ServletException {
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

                product.setImage(fileName);
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

    private void isValidCategory(HttpServletRequest req, Product product, List<String> errors) {
        try {
            int idCategories = Integer.parseInt(req.getParameter("sCategories"));
            if (iCategoryService.getCategoryById(idCategories)!=null) {
                product.setIdCategory(idCategories);
            }else{
                errors.add("Loại sản phẩm hợp lệ");
            }
        } catch (NumberFormatException numberFormatException) {
            errors.add("Định dạng loại sản phẩm chưa đúng");
        }
    }

    private void isValidName(HttpServletRequest req, Product product, List<String> errors) {
        String name = req.getParameter("name");
        if (!ValidateUtils.isNameValid(name)) {
            errors.add("Tên không hợp lệ. Chỉ chứa từ từ 4-14 kí và bắt đầu A-Za-z0-9");
        }
        product.setName(name);
    }
}
