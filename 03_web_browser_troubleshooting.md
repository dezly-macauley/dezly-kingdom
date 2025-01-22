## Having Download Issues?

E.g. You are seeing a messsage like this:

```
Hmm. We’re having trouble finding that site.

We can’t connect to the server at, 
name-of-website

If you entered the right address, you can:

    Try again later
    Check your network connection
    Check that Firefox has permission to access the web,
(you might be connected but behind a firewall)
```

---


#### Solution 1: Check your Firewall

If you are having issues downloading a file,
check if your Firewall is active.

---

#### Solution 2: Check that the site is actually working properly

Try pinging the site:
```
ping name-of-can't-connect-to-server-at
```

Try a traceroute:
```
traceroute name-of-can't-connect-to-server-at

```

---

#### Solution 3: (This one usually does the trick):

Flush the DNS Cache:

```bash
sudo systemctl restart systemd-resolved
```

---

Restart Network Manager:
```bash
sudo systemctl restart NetworkManager
```

Try to download your file again.

---
