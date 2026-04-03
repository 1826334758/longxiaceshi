from pathlib import Path
p = Path(r'C:\Users\18263\.openclaw\skills\dcai-grok\scripts\dcai_imagine.py').resolve()
print('SCRIPT', p)
for i, parent in enumerate(p.parents):
    print(i, parent)
