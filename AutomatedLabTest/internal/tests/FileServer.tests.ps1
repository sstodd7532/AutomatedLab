﻿param
(
    [Parameter(Mandatory)]
    [AutomatedLab.Lab]
    $Lab
)

Describe "$($Lab.Name) FileServer" -Tag FileServer {

    Context "Role deployment successful" {
        It "Should return the correct amount of machines" {
            (Get-LabVm -Role FileServer).Count | Should -Be $Lab.Machines.Where({$_.Roles.Name -contains 'FileServer'}).Count
        }
    }
}
