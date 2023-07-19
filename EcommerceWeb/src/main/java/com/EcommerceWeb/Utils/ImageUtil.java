package com.EcommerceWeb.Utils;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Component
public class ImageUtil {
    private final String Uload_Folder = "C:\\Users\\Asus\\Desktop\\ECommerceWeb\\EcommerceWeb\\src\\main\\resources\\META-INF\\imageOfProject";

    public boolean uploadImage(MultipartFile imageProduct) {
        boolean isUpload = false;
        try {
            Files.copy(imageProduct.getInputStream(),
                    Paths.get(Uload_Folder + File.separator, imageProduct.getOriginalFilename()),
                    StandardCopyOption.REPLACE_EXISTING);
            isUpload = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpload;
    }

    public boolean deleteImage(String image){
        try {
            File file = new File("C:\\Users\\Asus\\Desktop\\ECommerceWeb\\EcommerceWeb\\src\\main\\resources\\META-INF\\imageOfProject\\"+image+"");
            if(file.delete()) {
                System.out.println(file.getName() + " is deleted!");
                return true;
            } else {
                System.out.println("Delete operation is failed.");
                return false;
            }
        }
        catch(Exception e)
        {
            System.out.println("Failed to Delete image !!");
            return false;
        }
    }
}
