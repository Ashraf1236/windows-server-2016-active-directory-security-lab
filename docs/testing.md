# Testing & Verification Checklist

## Network and Domain

- [x] Server uses `192.168.0.1/24`
- [x] Windows 10 client uses `192.168.0.10/24`
- [x] Client DNS points to `192.168.0.1`
- [x] Client can ping the server
- [x] `ashraf.local` resolves to `192.168.0.1`
- [x] Domain secure channel verified successfully

## Active Directory / GPO

- [x] `SalesMarketing` OU exists
- [x] Bob, Karen, Paula, Kathy, Jon exist in the OU
- [x] Logon hours configured Monday–Friday, 8 AM–6 PM
- [x] Roaming profile share configured
- [x] Account lockout policy configured
- [x] Kathy-targeted Control Panel GPO created and security filtered

## File Security

- [x] `C:\SHARED\MRKTG\SALES.TXT` exists
- [x] Root user ACL entries are explicit
- [x] MRKTG inherits root permissions
- [x] MRKTG-specific Allow/Deny entries configured
- [x] Jon has a direct Read entry on SALES.TXT
- [x] `\\ASHRAF-SERVER\SHARED` opens over the network
- [x] Effective Access reviewed for all five users

## Auditing

- [x] Audit object access enabled for Success and Failure
- [x] SALES.TXT auditing entry configured for Everyone / All
- [x] Access activity generated
- [x] Security log reviewed
- [x] Event ID 4663 observed

## Future

- [ ] Task 4 software publishing
