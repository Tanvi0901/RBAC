package com.spring3.oauth.jwt.services;

import com.spring3.oauth.jwt.dtos.UserRequest;
import com.spring3.oauth.jwt.dtos.UserResponse;
import com.spring3.oauth.jwt.models.UserRole;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;

import java.util.List;
import java.util.Set;


public interface UserService {

    @PreAuthorize("hasAnyRole('ADMIN', 'SUPERUSER')")
    List<UserResponse> getAllUser();

    @PostAuthorize("returnObject.username == authentication.name or hasRole('ADMIN')")
    UserResponse getUserById(Long id);

    @PreAuthorize("hasRole('ADMIN')")
    UserResponse createUser(UserRequest user);

    @PreAuthorize("hasRole('SUPERUSER')")
    UserResponse updateUserRoles(Long id, Set<UserRole> roles);

    @PreAuthorize("hasRole('ADMIN')")
    public void deleteUser(Long id);

    @PreAuthorize("hasRole('SUPERUSER')")
    public List<UserResponse> getUsersByRole(UserRole role);





    public UserResponse saveUser(UserRequest userRequest);

    public UserResponse getUser();


}
