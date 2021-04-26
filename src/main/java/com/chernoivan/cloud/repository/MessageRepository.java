package com.chernoivan.cloud.repository;

import com.chernoivan.cloud.domain.Message;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepository extends CrudRepository<Message, Integer> {
    List<Message> findByAuthor(String tag);


    @Query("Select fileName from Message a where author = ?1 and file_name = ?2")
    String getDocumentName(Integer userId, String docType);
}
