# Ansible franklinkim.openssl role

[![Build Status](https://img.shields.io/travis/weareinteractive/ansible-openssl.svg)](https://travis-ci.org/weareinteractive/ansible-openssl)
[![Galaxy](http://img.shields.io/badge/galaxy-weareinteractive.openssl-blue.svg)](https://galaxy.ansible.com/weareinteractive/openssl)
[![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/ansible-openssl.svg)](https://github.com/weareinteractive/ansible-openssl)
[![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/ansible-openssl.svg)](https://github.com/weareinteractive/ansible-openssl)

> `franklinkim.openssl` is an [Ansible](http://www.ansible.com) role which:
>
> * installs openssl
> * configures openssl
> * imports ssl certificates and keys
> * creates a self-signed certificate
> * optionally installs the CACert root certificates

## Installation

Using `ansible-galaxy`:

```shell
$ ansible-galaxy install franklinkim.openssl
```

Using `requirements.yml`:

```yaml
- src: franklinkim.openssl
```

Using `git`:

```shell
$ git clone https://github.com/weareinteractive/ansible-openssl.git franklinkim.openssl
```

## Dependencies

* Ansible >= 2.4

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```yaml
---
# openssl_keys:
#   - name: mykey.key
#     key: "mykeycontents"
#   - name: myotherkey.key
#     cert: "myotherkeycontents"
#     mode: "0664"
#     owner: "www-data"
#     group: "www-data"
# openssl_certs:
#   - name: mycert.crt
#     cert: "mycertcontents"
#   - name: myothercert.crt
#     cert: "myothercertcontents"
#     mode: "0664"
#     owner: "www-data"
#     group: "www-data"
# openssl_self_signed:
#   - name: 'foobar.com'
#     domains: ['*.foobar.com', 'foobar.com']
#     country: 'DE'
#     state: 'Bavaria'
#     city: 'Munich'
#     organization: 'Foo Bar'
#     unit: ''
#     email: 'foo@bar.com'
#     days: 3650
# openssl_config:
#   default_bits: 2048
#   countryName_default: DE
#   stateOrProvinceName_default: Bavaria
#   localityName_default: Munich
#   organizationName_default: 'My Organization'
#   organizationalUnitName_default: 'My Organization Unit'
#   commonName_default: 'foobar.com'
# openssl_config_template: templates/openssl.cnf.j2

# keys to import
openssl_keys: []
# certificates to import
openssl_certs: []
# path to certificates
openssl_certs_path: /etc/ssl/certs
# path to keys
openssl_keys_path: /etc/ssl/private
# default key owner
openssl_default_key_owner: ssl-cert
# default key group
openssl_default_key_group: root
# default cert owner
openssl_default_cert_owner: root
# default cert group
openssl_default_cert_group: root
# self signed certificates
openssl_self_signed: []
# config variables
openssl_config: {}
# config template to install, relative to the ansible repository root
openssl_config_template:
# generate a CSR for each self signed certificate
openssl_generate_csr: no
# path to certificate signing requests
openssl_csrs_path: /etc/ssl/csrs
# should CAcert certificates be downloaded and added to the keyring?
openssl_cacert_import: no
# overrides for the file checksum when the CACert root certificates are downloaded.
# must be the output of 'sha256sum <name of certificate>'
openssl_cacert_class_one_key_sha256: 'c0e0773a79dceb622ef6410577c19c1e177fb2eb9c623a49340de3c9f1de2560'
openssl_cacert_class_three_key_sha256: 'f5badaa5da1cc05b110a9492455a2c2790d00c7175dcf3a7bcb5441af71bf84f'

```


## Usage

This is an example playbook:

```yaml
---

- hosts: all
  roles:
    - franklinkim.openssl
  vars:
    openssl_keys:
      - name: foobar.com.key
        key: "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDhSsYh36iAShzd\nNM0dSxiVXFe3WCZbePTQSNQ0hnFyBF1AfQKzpo9kFP3h+/IxzUNcPREAqOjmIfl4\ndVTXicyqVrqwt1su90+DitRmvYU0e4PDAA9pwQAxdT1qGBnzBFMgs/JpwQNQetCz\nzISDYn0QbaBGLXs6+UkDGyKu8LCX/T0vOLQ/LecDleZrXf6ubqK7H9SGtGsPLlDw\nonAe+KKieDYJlfHX9omaC953fp8aKDA7V5g/3KbkhsERDl6b/++fNjlestgnZMms\nYdDsM6MzBlt+3f0YQQXzVsmO8LGJxLMSMEmmg76e1VegPq+FyjMQp8r+8i2y/Tvz\nadL0bnivAgMBAAECggEBAKhbp4rCx/nu6HkKL0n3x4w+cLJrpmZvEovgEOybl4V7\n62/4u58jFj7VTRCmpcw/t1njrKQQldL8iqBRFjDoIlEc9PCAZRzI5dvIUIfikvuw\nXbvIfLwr5YgQM+/nyOSJU9G5h6st+NsYnIPwjwpb/FfdhItNC6z7g2tVyOpwpZc9\n2WwJadASIew3GOSd3gLoZLiO+r6XdPc//VcAxaNhu1B5RMHpQxeKa7KQ9T3CzCj4\nTBvIxV5LKAiGMlE26WZR7X2xkLzWswCsk8SAv9ulqbuKlSoPMh86BadM5H6SeGuP\ncsTcTGgoAmhbNmUN/j3lOjHJed7oUKEQGVgGIh4W1OkCgYEA+ECUtXl/sQzUiAYz\nKy556wb31v31D+tVftYU5BzwB/YO7T1ApY1/Bzs/KbnXiKu3eb3IyfEVe/CTcyE9\nhTrJJr5b6Nesa4n0PMpxHfZbWloGoewyfVl7Dgu6/KFctKFm17QcFSG7NsGraE6L\nBQ80gWo94Fyt1nXN9+myUeKga5sCgYEA6FLAgUFS7ykFA0bh5MLV1Q9IZav86Hky\nOmgM1ysd/B9ObRAxKaQezvK+4uyaUW55d8pQZJE2YQo84KPX1wFiAPkR5dwm/C1J\nuH9fz5OycXTUS0LJYGFLmeyKSQ4N+V+8Ex5laFqhHXE8Rzpi/QbYuf4V2EDPlY4g\n6kQgtzS/qn0CgYAQfDlj062nFDMI1WCQfYWbFdtfa33akMYcphq9Cy7lWHGlT2v7\nkmndERIgszac3MpSS0gKIPhMQq2H960eK8kvyXRRAgFxIrgVUVwxoSpv1YqbNhQk\nPsztIdpI7G47kHxD1rIGtTa5bCL1ykFxFJFoBqYVQBJLK4eB7wLobSQ6AQKBgEiB\n+z7cCmxGGyBosPvaqy4x9OB2ixprKPf9nXRSKquTgcCcOxvJ8yuXq2fbfFZJ6nMu\nm2SnxZcHwPRDbovWDKZNFf7tdOVjpQyGBHsel6S9V7ydfYgtFZFWt9oRHt9jt6kn\n5XJqRrqPqsZ4PIjH6EA0QtEZeTAuCavT03oaZm9pAoGBAPVuxRWNqfF7fWbLZiHG\nq3ykwooYtbSfixRe2y/h7IHrQyCbAEG/V2FBPKTNhh0zwHpRTS4PFRL3h+ZQNYrr\n/n+zN/OJl/75P53NDlZ5n1m1eYPMbVjDvvTDDdWqkESLUvTRT7JnyiXApRY0EWTA\nArNAJBxDBD66sa5BM9hZV9fG\n-----END PRIVATE KEY-----\n"
    openssl_certs:
      - name: foobar.com.crt
        cert: "-----BEGIN CERTIFICATE-----\nMIIDuTCCAqGgAwIBAgIJAO7EaRwLzPYyMA0GCSqGSIb3DQEBCwUAMHMxCzAJBgNV\nBAYTAkRFMRAwDgYDVQQIDAdCYXZhcmlhMQ8wDQYDVQQHDAZNdW5pY2gxEDAOBgNV\nBAoMB0ZvbyBCYXIxEzARBgNVBAMMCmZvb2Jhci5jb20xGjAYBgkqhkiG9w0BCQEW\nC2Zvb0BiYXIuY29tMB4XDTE0MDgwMjE1NTMxNloXDTI0MDczMDE1NTMxNlowczEL\nMAkGA1UEBhMCREUxEDAOBgNVBAgMB0JhdmFyaWExDzANBgNVBAcMBk11bmljaDEQ\nMA4GA1UECgwHRm9vIEJhcjETMBEGA1UEAwwKZm9vYmFyLmNvbTEaMBgGCSqGSIb3\nDQEJARYLZm9vQGJhci5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB\nAQDhSsYh36iAShzdNM0dSxiVXFe3WCZbePTQSNQ0hnFyBF1AfQKzpo9kFP3h+/Ix\nzUNcPREAqOjmIfl4dVTXicyqVrqwt1su90+DitRmvYU0e4PDAA9pwQAxdT1qGBnz\nBFMgs/JpwQNQetCzzISDYn0QbaBGLXs6+UkDGyKu8LCX/T0vOLQ/LecDleZrXf6u\nbqK7H9SGtGsPLlDwonAe+KKieDYJlfHX9omaC953fp8aKDA7V5g/3KbkhsERDl6b\n/++fNjlestgnZMmsYdDsM6MzBlt+3f0YQQXzVsmO8LGJxLMSMEmmg76e1VegPq+F\nyjMQp8r+8i2y/TvzadL0bnivAgMBAAGjUDBOMB0GA1UdDgQWBBTMI1BoL1dh9tov\nQxJHM6GnZfBhMTAfBgNVHSMEGDAWgBTMI1BoL1dh9tovQxJHM6GnZfBhMTAMBgNV\nHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQALezxaXABZEQE6RDmtfBE7jdGy\nxWJVLxSoH0+YNNVXDYNCwNdDMBbjcH6B//aaGLc6Zqif7+HlRfmr4SVfjIP8UQZR\nSQ2s/tcftR6Wp2aadIdUZZkIvmaWvyFfBrrm8F6Ot22Y8EIgjSl/y4kewM6qD1MY\nxC7qAwze2k0yPqVdAXFYJh/+thRTV4YA9R8OCVVRO4xoEOGsTOsHQYH7+/lR3U+o\nbmBu+k1pPK+LYCoQyIrIB6xHqRYf4nHirxlbu4+aAY1Rc57Okbk68g6ThA27r8Ay\n/14Fu1Ry6NAq/1zeSzX4JrFQOlZDNtqF0UXgph2RehMZjtQG2b4B8gLpwPRe\n-----END CERTIFICATE-----\n"
    openssl_self_signed:
      - { name: 'foobar.org', country: 'DE', state: 'Bavaria', city: 'Munich', organization: 'Foo Bar', unit: '', email: 'foo@bar.com', days: 3650 }
      - { name: '*.foobar.org', domains: ['foobar.org', '*.foobar.org'], country: 'DE', state: 'Bavaria', city: 'Munich', organization: 'Foo Bar', unit: '', email: 'foo@bar.com', days: 3650 }
    openssl_keys_path: /etc/my-ssl/private
    openssl_certs_path: /etc/my-ssl/certs
    openssl_default_key_owner: root
    openssl_default_key_group: root
    openssl_default_cert_owner: root
    openssl_default_cert_group: root
    openssl_config:
      default_bits: 2048
      countryName_default: DE
      stateOrProvinceName_default: Bavaria
      localityName_default: Munich
      organizationName_default: 'My Organization'
      organizationalUnitName_default: 'My Organization Unit'
      commonName_default: 'foobar.com'
    openssl_cacert_import: yes
    openssl_generate_csr: yes

```


## Testing

```shell
$ git clone https://github.com/weareinteractive/ansible-openssl.git
$ cd ansible-openssl
$ make test
```

## Contributing
In lieu of a formal style guide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

*Note: To update the `README.md` file please install and run `ansible-role`:*

```shell
$ gem install ansible-role
$ ansible-role docgen
```

## License
Copyright (c) We Are Interactive under the MIT license.
