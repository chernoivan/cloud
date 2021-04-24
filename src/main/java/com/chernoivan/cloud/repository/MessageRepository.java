package com.chernoivan.cloud.repository;

import com.chernoivan.cloud.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepository extends CrudRepository<Message, Integer> {
    List<Message> findByAuthor(String tag);
}
