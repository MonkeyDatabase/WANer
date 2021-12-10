package io.github.monkeydatabase.northoperator;

import io.github.monkeydatabase.northoperator.dto.UserBasicInformationDTO;

public interface NorthOperatorAuthService {
    UserBasicInformationDTO getBasicInfoByUsername(String username);
}
