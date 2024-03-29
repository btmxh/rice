#!/usr/bin/env python3
import json
import subprocess
import sys

def shorten(text, max_length):
    return text if len(text) <= max_length else (text[:max_length-1] + '…')

artist_aliases = {
    "Foreground Eclipse": "F. Eclipse",
    "hololive IDOL PROJECT": "hololive I.P.",
    "温泉むすめ SPRiNGS": "SPRiNGS",
    "温泉むすめ petit corolla": "petit corolla",
    "CHiCO with HoneyWorks": "CHiCO w/ HW",
}

def trim_artist_name(artist):
    artist = artist.removesuffix(' - Topic')
    return artist

def get_current_music_title():
    max_title_len = 40
    max_artist_len = 20

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

    error, title = subprocess.getstatusoutput('playerctl metadata title')
    if error != 0:
        return ["", color]
    error, artist = subprocess.getstatusoutput('playerctl metadata artist')
    if error != 0:
        return ["", color]
    if artist in artist_aliases:
        artist = artist_aliases[artist]
    else:
        artist = trim_artist_name(artist)

    max_title_len += max(0, max_artist_len - len(artist))
    max_artist_len += max(0, max_title_len - len(title))

    title = shorten(title, max_title_len)
    artist = shorten(artist, max_artist_len)

    return [f"{emote} {artist} - {title}", color]

def get_current_headset_battery_level():
    output = subprocess.getoutput('upower -i /org/freedesktop/UPower/devices/headset_dev_41_42_77_9D_CD_D0')
    for line in output.splitlines():
        if 'percentage:' in line:
            s = line[line.index('percentage:') + len('percentage:'):].strip()[:-1]
            if 'should be ignored' in s:
                return None
            num = int(s)
            if num > 70: 
                color = '#98c379'
            else:
                color = '#56b6c2'
            return [f'󰋎 {num}%', color]
    return None

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
        pair = get_current_headset_battery_level()
        if pair is not None:
            [text, color] = pair
            j.insert(0, {
                'full_text': '%s' % text,
                'color': color,
                'name': 'music_title',
                'separator_block_width': 25})

        print_line(prefix+json.dumps(j))
