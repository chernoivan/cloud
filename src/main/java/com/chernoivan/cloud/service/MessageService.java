package com.chernoivan.cloud.service;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;

import java.io.FileNotFoundException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class MessageService {

    private String uploadPath = "C:/Users/Alexander/repos/cloud/uploads";


    public Resource loadFileAsResource(String fileName) throws Exception {
        try {
            Path filePath = Paths.get(uploadPath + "/" + (fileName));
            Resource resource = new UrlResource(filePath.toUri());
            if(resource.exists()) {
                return resource;
            } else {
                throw new FileNotFoundException("File not found " + fileName);
            }
        } catch (MalformedURLException ex) {
            throw new FileNotFoundException("File not found " + fileName);
        }
    }
}
