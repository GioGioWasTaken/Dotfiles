from bs4 import BeautifulSoup

with open("bookmarks.html", "r", encoding="utf-8") as f:
    soup = BeautifulSoup(f, "html.parser")

for a in soup.find_all("a"):
    name = a.get_text(strip=True)
    href = a.get("href")
    if name and href:
        print(f"{name} = {href}")
