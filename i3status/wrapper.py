#!/usr/bin/env python3
import json
import subprocess
import sys
import textwrap

def get_current_music_title():
    max_title_len = 16
    max_artist_len = 12

    status = subprocess.getoutput('playerctl status')
    
    if 'Playing' in status: 
        emote = ''
        color = '#98c379'
    elif 'Paused' in status:
        emote = ''
        color = '#56b6c2'
    else:
        emote = ''
        color = '#56b6c2'

    title = subprocess.getoutput('playerctl metadata title')
    if 'No players found' in title:
        return ""
    artist = subprocess.getoutput('playerctl metadata artist')

    max_title_len += max(0, max_artist_len - len(artist))
    max_artist_len += max(0, max_title_len - len(title))

    title = textwrap.shorten(title, width=max_title_len, placeholder='...')
    artist = textwrap.shorten(artist, width=max_artist_len, placeholder='...')

    return [f"{emote} {artist} - {title}", color]

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()


def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()


if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''

        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','
        j = json.loads(line)

        [music_title, color] = get_current_music_title()
        # this is where the magic happens
        # https://i3wm.org/docs/i3bar-protocol.html
        j.insert(0, {
            'full_text': '%s' % music_title,
            'color': color,
            'name': 'music_title',
            'separator_block_width': 25})

        print_line(prefix+json.dumps(j))
