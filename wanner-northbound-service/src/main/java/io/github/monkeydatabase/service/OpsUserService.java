package io.github.monkeydatabase.service;

import io.github.monkeydatabase.northoperator.dao.OpsUserDAO;
import io.github.monkeydatabase.northoperator.domain.OpsUserDO;
import org.springframework.stereotype.Service;

@Service
public class OpsUserService {
    final OpsUserDAO opsUserDAO;

    public OpsUserService(OpsUserDAO opsUserDAO) {
        this.opsUserDAO = opsUserDAO;
    }

    public OpsUserDO getUser(Integer id) {
        return opsUserDAO.getUserById(id);
    }
}
