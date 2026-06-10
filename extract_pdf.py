import pypdf

reader = pypdf.PdfReader("RoboPet_Phase4_Decor_Shop.pdf")
with open("pdf_text_decor.txt", "w", encoding="utf-8") as f:
    for page in reader.pages:
        f.write(page.extract_text() + "\n")
