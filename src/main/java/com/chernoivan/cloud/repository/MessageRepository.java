package com.chernoivan.cloud.repository;

import com.chernoivan.cloud.domain.Message;
import org.springframework.data.repository.CrudRepository;

public interface MessageRepository extends CrudRepository<Message, Integer> {
}
