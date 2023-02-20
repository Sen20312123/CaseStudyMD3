package com.example.casestudy3.utils;

import java.util.regex.Pattern;

public class ValidateUtils {
    public static final String ADDRESS_REGEX = "^[A-Za-z0-9][A-Za-z0-9\\s]{4,14}$";
    public static final String NAME_REGEX = "^[A-Za-z0-9][A-Za-z0-9\\s]{2,15}$";

    public static boolean isAddressValid(String address) {
        return Pattern.compile(ADDRESS_REGEX).matcher(address).matches();
    }
    public static boolean isNameValid(String name) {
        return Pattern.compile(NAME_REGEX).matcher(name).matches();
    }

}
