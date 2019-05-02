import imaplib
obj = imaplib.IMAP4_SSL('mail.andreahasani.com', '993')
obj.login('email@andreahasani.com', 'Mei6Iwei')
obj.select('Automated')
result, data = obj.uid('SEARCH', None, '(UNSEEN)')
uids = data[0].split()
for uid in uids:
    result, data = obj.uid('fetch', uid, '(RFC822)') 
    result = obj.uid("STORE", uid, '+FLAGS', '\\Seen')

obj.close()
