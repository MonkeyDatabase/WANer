package io.github.monkeydatabase.northoperator;

import io.github.monkeydatabase.northoperator.dao.OpsRoleDAO;
import io.github.monkeydatabase.northoperator.dao.OpsUserDAO;
import io.github.monkeydatabase.northoperator.domain.OpsUserDO;
import io.github.monkeydatabase.northoperator.dto.UserBasicInformationDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NorthOperatorAuthServiceImpl implements NorthOperatorAuthService {
    private final OpsUserDAO opsUserDAO;
    private final OpsRoleDAO opsRoleDAO;

    public NorthOperatorAuthServiceImpl(OpsUserDAO opsUserDAO, OpsRoleDAO opsRoleDAO) {
        this.opsUserDAO = opsUserDAO;
        this.opsRoleDAO = opsRoleDAO;
    }

    @Override
    public UserBasicInformationDTO getBasicInfoByUsername(String username) {
        UserBasicInformationDTO informationDTO = new UserBasicInformationDTO();
        OpsUserDO opsUserDO = opsUserDAO.getUserDOByUsername(username);

        if (opsUserDO == null) {
            return null;
        }

        informationDTO.setUsername(username);
        informationDTO.setPassword(opsUserDO.getPassword());
        informationDTO.setStatus(opsUserDO.getStatus() == 1);

        List<String> roles = opsUserDAO.getRolesByUsername(username);
        informationDTO.setRoles(roles);

        List<String> apis = opsRoleDAO.getApisByRoleNames(roles);

        informationDTO.setApis(apis);

        return informationDTO;
    }
}
