# Lab Notes

## 1. Server and Domain Build

- Renamed the Windows Server 2016 system to `ASHRAF-SERVER`.
- Configured static IPv4 address `192.168.0.1` with subnet mask `255.255.255.0`.
- Used loopback DNS `127.0.0.1` on the domain controller.
- Installed AD DS and created a new forest/domain: `ashraf.local`.
- Verified domain Administrator context after promotion.

## 2. Active Directory Objects

Created the `SalesMarketing` OU and these users:

- Bob
- Karen
- Paula
- Kathy
- Jon

Each account was configured with Monday–Friday logon hours from 8:00 AM to 6:00 PM.

## 3. Roaming Profiles

Created and shared `C:\Profiles` as:

```text
\\ASHRAF-SERVER\Profiles
```

Created individual user profile folders and configured the users' profile paths to point to their corresponding UNC folders.

## 4. Account Lockout Policy

Configured in the Default Domain Policy:

- Account lockout threshold: 3 invalid logon attempts
- Account lockout duration: 30 minutes
- Reset account lockout counter after: 30 minutes

## 5. Kathy Control Panel GPO

Created `Hide Control Panel - Kathy` and enabled the user policy that prohibits access to Control Panel and PC settings. The GPO was scoped to the `SalesMarketing` OU and security-filtered for Kathy.

## 6. Windows 10 Client

Configured:

- IPv4: `192.168.0.10`
- Subnet: `255.255.255.0`
- DNS: `192.168.0.1`

Verified:

```text
ping 192.168.0.1
nslookup ashraf.local
nltest /sc_verify:ashraf.local
```

## 7. File Security

Built:

```text
C:\SHARED\MRKTG\SALES.TXT
```

The permissions were intentionally designed to demonstrate:

- explicit ACL entries
- inherited ACL entries
- Deny overriding Allow
- folder-only List permissions
- direct file permissions
- Effective Access evaluation

See `permission-matrix.md` for the complete matrix.

## 8. Auditing

Enabled object-access auditing for success and failure. Added an auditing entry to `SALES.TXT` for `Everyone`, Type `All`, with all permissions selected. Access was then generated and reviewed in Event Viewer under the Security log, using Event ID `4663` as the access-event filter.

## 9. Pending Work

Task 4 remains pending and will be documented only after it is implemented and tested.
