#/usr/bin/env python
import glob, os;
for file in glob.glob('windows_theme/Bijou *.ani'): os.system(f'mv "{file}" ' + file.replace('Bijou ', ''))
