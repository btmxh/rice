all = ['text', 'move', 'hand']
with open('mapping.txt') as f:
    for [name, target] in [map(lambda x: x.strip(), line.split(' ')) for line in f.readlines()]:
        print(f'linux_theme/cursors/{name}: linux_theme/cursors/{target}')
        print('\tln -fsr $< $@')
        all.append(name)
print('all: ' + ' '.join(map(lambda x: 'linux_theme/cursors/' + x, all)))
