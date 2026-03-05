import os

files = ['index.html', 'about.html', 'products.html', 'certificates.html', 'contact.html']

for f in files:
    filepath = os.path.join(r"c:\Users\akash\Art India", f)
    if not os.path.exists(filepath):
        continue
        
    with open(filepath, 'r', encoding='utf-8') as file:
        content = file.read()
    
    content = content.replace('https://artindiatex.com/example/i/thumbs/', 'assets/images/thumbs/')
    content = content.replace('https://artindiatex.com/example/i/', 'assets/images/')
    content = content.replace('https://artindiatex.com/images/', 'assets/images/')
    content = content.replace('http://artindiatex.com/example/i/thumbs/', 'assets/images/thumbs/')
    content = content.replace('http://artindiatex.com/example/i/', 'assets/images/')
    content = content.replace('http://artindiatex.com/images/', 'assets/images/')
    
    with open(filepath, 'w', encoding='utf-8') as file:
        file.write(content)

print("Replacement complete.")
