# WANer

1. Account
   * northbound-servce -> OpsAccount
   * NetPoP -> PoPAccount
   * employee link to company -> EmployeeAccount
2. Main Structure
   * Northbound: the interface that ops can submit jobs to the wan
   * Southbound: to parse the job from Northbound and interact with Device
   * Device Agent: the agent is place on every router which control the traffic in the wan, it can do some atomic operation on the device configuration