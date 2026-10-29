# Permission Matrix

## SHARED

Inheritance for user permissions was removed at the root and explicit permissions were assigned.

| User | Direct permission |
|---|---|
| Bob | Read, Write, List folder contents, Read & Execute |
| Karen | List folder contents |
| Paula | Read, List folder contents |
| Kathy | Modify, Read & Execute, List, Read, Write |
| Jon | List folder contents |

## MRKTG

`MRKTG` inherits from `SHARED`, then receives these additional explicit entries:

| User | Explicit entry on MRKTG |
|---|---|
| Bob | Deny Write |
| Karen | Deny List folder / read data; folder/subfolders scope |
| Paula | Allow Modify |
| Kathy | Deny Read & Execute, List, Read |
| Jon | Allow Write + separate Deny List folder / read data |

## SALES.TXT

`SALES.TXT` inherits applicable entries from its parents and has one additional direct entry:

| User | Direct entry on SALES.TXT |
|---|---|
| Jon | Allow Read |

## Design Notes

- **Deny** entries override conflicting **Allow** entries.
- Folder List permissions for Karen and Jon were scoped to folders/subfolders so they did not become unintended file read-data permissions.
- Effective Access was checked for all five users after configuration.
- Share permissions were broad so NTFS permissions remained the primary authorization control.
