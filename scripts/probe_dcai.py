import json, os, ssl, sys, urllib.request, urllib.error

bases = [
    'https://ai.dcvx.cn',
    'https://ai.td.ee',
    'https://ai.91hk.vip',
]
key = os.environ.get('DCAI_KEY', '')
body = json.dumps({
    'model': 'grok-imagine-1.0',
    'input': 'test cat',
    'stream': False,
}).encode('utf-8')
headers = {
    'Content-Type': 'application/json',
}
if key:
    headers['Authorization'] = f'Bearer {key}'

ctx = ssl.create_default_context()
for base in bases:
    url = base.rstrip('/') + '/v1/responses'
    print('URL', url)
    req = urllib.request.Request(url, data=body, headers=headers, method='POST')
    try:
        with urllib.request.urlopen(req, context=ctx, timeout=30) as resp:
            print('STATUS', resp.status)
            print(resp.read(400).decode('utf-8', errors='replace'))
    except urllib.error.HTTPError as e:
        print('HTTP', e.code)
        try:
            print(e.read(400).decode('utf-8', errors='replace'))
        except Exception as ex:
            print('READERR', ex)
    except Exception as e:
        print(type(e).__name__, str(e))
    print('---')
