# Ansible Openssl Role

[![Build Status](https://travis-ci.org/weareinteractive/ansible-openssl.png?branch=master)](https://travis-ci.org/weareinteractive/ansible-openssl)
[![Stories in Ready](https://badge.waffle.io/weareinteractive/ansible-openssl.svg?label=ready&title=Ready)](http://waffle.io/weareinteractive/ansible-openssl)

> `openssl` is an [ansible](http://www.ansible.com) role which: 
> 
> * installs openssl
> * imports ssl certificates and keys
> * creates a self-signed certificate

## Installation

Using `ansible-galaxy`:

```
$ ansible-galaxy install franklinkim.openssl
```

Using `arm` ([Ansible Role Manager](https://github.com/mirskytech/ansible-role-manager/)):

```
$ arm install franklinkim.openssl
```

Using `git`:

```
$ git clone https://github.com/weareinteractive/ansible-openssl.git
```

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```
# openssl_keys:
#   - { name: mykey, key: "mykeycontents" }
# openssl_certs:
#   - { name: mycert, cert: "mycertcontents" }
# openssl_self_signed:
#   - { name: 'foobar.com', country: 'DE', state: 'Bavaria', city: 'Munich', organization: 'Foo Bar', unit: '', email: 'foo@bar.com', days: 3650 }
#

# should we import cacert.org
openssl_cacert_import: no
# keys to import
openssl_keys: []
# certificates to import
openssl_certs: []
# path to certificates
openssl_certs_path: /etc/ssl/certs
# path to keys
openssl_keys_path: /etc/ssl/private
# self signed certificates
openssl_self_signed: []
```

## Example playbook

```
- host: all
  roles: 
    - franklinkim.openssl
  vars:
    openssl_keys:
      - { name: foobar.com, key: "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDhSsYh36iAShzd\nNM0dSxiVXFe3WCZbePTQSNQ0hnFyBF1AfQKzpo9kFP3h+/IxzUNcPREAqOjmIfl4\ndVTXicyqVrqwt1su90+DitRmvYU0e4PDAA9pwQAxdT1qGBnzBFMgs/JpwQNQetCz\nzISDYn0QbaBGLXs6+UkDGyKu8LCX/T0vOLQ/LecDleZrXf6ubqK7H9SGtGsPLlDw\nonAe+KKieDYJlfHX9omaC953fp8aKDA7V5g/3KbkhsERDl6b/++fNjlestgnZMms\nYdDsM6MzBlt+3f0YQQXzVsmO8LGJxLMSMEmmg76e1VegPq+FyjMQp8r+8i2y/Tvz\nadL0bnivAgMBAAECggEBAKhbp4rCx/nu6HkKL0n3x4w+cLJrpmZvEovgEOybl4V7\n62/4u58jFj7VTRCmpcw/t1njrKQQldL8iqBRFjDoIlEc9PCAZRzI5dvIUIfikvuw\nXbvIfLwr5YgQM+/nyOSJU9G5h6st+NsYnIPwjwpb/FfdhItNC6z7g2tVyOpwpZc9\n2WwJadASIew3GOSd3gLoZLiO+r6XdPc//VcAxaNhu1B5RMHpQxeKa7KQ9T3CzCj4\nTBvIxV5LKAiGMlE26WZR7X2xkLzWswCsk8SAv9ulqbuKlSoPMh86BadM5H6SeGuP\ncsTcTGgoAmhbNmUN/j3lOjHJed7oUKEQGVgGIh4W1OkCgYEA+ECUtXl/sQzUiAYz\nKy556wb31v31D+tVftYU5BzwB/YO7T1ApY1/Bzs/KbnXiKu3eb3IyfEVe/CTcyE9\nhTrJJr5b6Nesa4n0PMpxHfZbWloGoewyfVl7Dgu6/KFctKFm17QcFSG7NsGraE6L\nBQ80gWo94Fyt1nXN9+myUeKga5sCgYEA6FLAgUFS7ykFA0bh5MLV1Q9IZav86Hky\nOmgM1ysd/B9ObRAxKaQezvK+4uyaUW55d8pQZJE2YQo84KPX1wFiAPkR5dwm/C1J\nuH9fz5OycXTUS0LJYGFLmeyKSQ4N+V+8Ex5laFqhHXE8Rzpi/QbYuf4V2EDPlY4g\n6kQgtzS/qn0CgYAQfDlj062nFDMI1WCQfYWbFdtfa33akMYcphq9Cy7lWHGlT2v7\nkmndERIgszac3MpSS0gKIPhMQq2H960eK8kvyXRRAgFxIrgVUVwxoSpv1YqbNhQk\nPsztIdpI7G47kHxD1rIGtTa5bCL1ykFxFJFoBqYVQBJLK4eB7wLobSQ6AQKBgEiB\n+z7cCmxGGyBosPvaqy4x9OB2ixprKPf9nXRSKquTgcCcOxvJ8yuXq2fbfFZJ6nMu\nm2SnxZcHwPRDbovWDKZNFf7tdOVjpQyGBHsel6S9V7ydfYgtFZFWt9oRHt9jt6kn\n5XJqRrqPqsZ4PIjH6EA0QtEZeTAuCavT03oaZm9pAoGBAPVuxRWNqfF7fWbLZiHG\nq3ykwooYtbSfixRe2y/h7IHrQyCbAEG/V2FBPKTNhh0zwHpRTS4PFRL3h+ZQNYrr\n/n+zN/OJl/75P53NDlZ5n1m1eYPMbVjDvvTDDdWqkESLUvTRT7JnyiXApRY0EWTA\nArNAJBxDBD66sa5BM9hZV9fG\n-----END PRIVATE KEY-----\n" }
    openssl_certs:
      - { name: foobar.com, cert: "-----BEGIN CERTIFICATE-----\nMIIDuTCCAqGgAwIBAgIJAO7EaRwLzPYyMA0GCSqGSIb3DQEBCwUAMHMxCzAJBgNV\nBAYTAkRFMRAwDgYDVQQIDAdCYXZhcmlhMQ8wDQYDVQQHDAZNdW5pY2gxEDAOBgNV\nBAoMB0ZvbyBCYXIxEzARBgNVBAMMCmZvb2Jhci5jb20xGjAYBgkqhkiG9w0BCQEW\nC2Zvb0BiYXIuY29tMB4XDTE0MDgwMjE1NTMxNloXDTI0MDczMDE1NTMxNlowczEL\nMAkGA1UEBhMCREUxEDAOBgNVBAgMB0JhdmFyaWExDzANBgNVBAcMBk11bmljaDEQ\nMA4GA1UECgwHRm9vIEJhcjETMBEGA1UEAwwKZm9vYmFyLmNvbTEaMBgGCSqGSIb3\nDQEJARYLZm9vQGJhci5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB\nAQDhSsYh36iAShzdNM0dSxiVXFe3WCZbePTQSNQ0hnFyBF1AfQKzpo9kFP3h+/Ix\nzUNcPREAqOjmIfl4dVTXicyqVrqwt1su90+DitRmvYU0e4PDAA9pwQAxdT1qGBnz\nBFMgs/JpwQNQetCzzISDYn0QbaBGLXs6+UkDGyKu8LCX/T0vOLQ/LecDleZrXf6u\nbqK7H9SGtGsPLlDwonAe+KKieDYJlfHX9omaC953fp8aKDA7V5g/3KbkhsERDl6b\n/++fNjlestgnZMmsYdDsM6MzBlt+3f0YQQXzVsmO8LGJxLMSMEmmg76e1VegPq+F\nyjMQp8r+8i2y/TvzadL0bnivAgMBAAGjUDBOMB0GA1UdDgQWBBTMI1BoL1dh9tov\nQxJHM6GnZfBhMTAfBgNVHSMEGDAWgBTMI1BoL1dh9tovQxJHM6GnZfBhMTAMBgNV\nHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQALezxaXABZEQE6RDmtfBE7jdGy\nxWJVLxSoH0+YNNVXDYNCwNdDMBbjcH6B//aaGLc6Zqif7+HlRfmr4SVfjIP8UQZR\nSQ2s/tcftR6Wp2aadIdUZZkIvmaWvyFfBrrm8F6Ot22Y8EIgjSl/y4kewM6qD1MY\nxC7qAwze2k0yPqVdAXFYJh/+thRTV4YA9R8OCVVRO4xoEOGsTOsHQYH7+/lR3U+o\nbmBu+k1pPK+LYCoQyIrIB6xHqRYf4nHirxlbu4+aAY1Rc57Okbk68g6ThA27r8Ay\n/14Fu1Ry6NAq/1zeSzX4JrFQOlZDNtqF0UXgph2RehMZjtQG2b4B8gLpwPRe\n-----END CERTIFICATE-----\n" }
    openssl_self_signed:
      - { name: 'foobar.org', country: 'DE', state: 'Bavaria', city: 'Munich', organization: 'Foo Bar', unit: '', email: 'foo@bar.com', days: 3650 }
```

## Testing

```
$ git clone https://github.com/weareinteractive/ansible-opensll.git
$ cd ansible-opensll
$ vagrant up
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright (c) We Are Interactive under the MIT license.
