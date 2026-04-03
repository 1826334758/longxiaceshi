import json, os
from pathlib import Path

skill_dir = Path(r'C:\Users\18263\.openclaw\skills\dcai-grok')
config_path = skill_dir / 'local_config.json'
example_path = skill_dir / 'local_config.example.json'

def mask(v):
    if not v:
        return 'EMPTY'
    if len(v) <= 8:
        return '*' * len(v)
    return v[:4] + '...' + v[-4:] + f' (len={len(v)})'

env_key = os.environ.get('DCAI_KEY', '')
print('ENV_KEY', mask(env_key))
for p in [config_path, example_path]:
    print('FILE', p)
    if not p.exists():
        print('  MISSING')
        continue
    try:
        data = json.loads(p.read_text(encoding='utf-8'))
        print('  apiKey', mask(str(data.get('apiKey', ''))))
        print('  base', data.get('base', ''))
    except Exception as e:
        print('  ERROR', e)
