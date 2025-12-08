#!/usr/bin/env python3
import sys
import json
import subprocess

TEXTFORMAT = "{artist} - {title}"

EXEC = "/usr/bin/rmpc"

def get_status():
    song = json.loads(subprocess.check_output([EXEC, "song"], text=True))
    text = TEXTFORMAT.format(
            artist=song["metadata"]["artist"],
            title=song["metadata"]["title"])
    state = json.loads(subprocess.check_output([EXEC, "status"], text=True))
    alt = state["state"].lower() # play, pause, stop
    return '{{"text": "{text}", "alt":"{alt}", "class": "{alt}"}}'.format(text=text, alt=alt)

def togglepause():
    subprocess.run([EXEC, "togglepause"])
    return get_status()

def next_song():
    subprocess.run([EXEC, "next"])
    return get_status()

OPTION_FUNCS = {
    "status": get_status,
    "togglepause": togglepause,
    "next": next_song
}

option = sys.argv[1]
result = OPTION_FUNCS.get(option, lambda: sys.exit(1))()
print(result)
