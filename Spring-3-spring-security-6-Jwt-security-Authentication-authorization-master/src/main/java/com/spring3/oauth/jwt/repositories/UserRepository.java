package com.spring3.oauth.jwt.repositories;
import com.spring3.oauth.jwt.models.UserInfo;
import com.spring3.oauth.jwt.models.UserRole;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface UserRepository extends CrudRepository<UserInfo, Long> {

   public UserInfo findByUsername(String username);
   public UserInfo findFirstById(Long id);
   public List<UserInfo> findAllByRoles(UserRole role);


}
