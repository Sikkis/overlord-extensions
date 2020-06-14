## Overlord User Management

The ansible playbook creates two users with sudo privileges, uploads their public key and enables terminal logging for bash and tmux.

## How to use:
Add the user-management.yml file to the `overlord/redbaron/data/playbook/` directory and at modify the password hash for your user.
The command to generate a sha512 hash is:

```ansible all -i localhost, -m debug -a "msg={{ 'mypassword' | password_hash('sha512', 'mysecretsalt') }}"```

Add the path to your *pub keys* and for the `bash-logger.sh` 