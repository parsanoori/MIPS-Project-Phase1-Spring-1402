#!/usr/bin/env python3

# this pgrogram converts an assembly file to a hex file
# it uses spim to assemble the file
# it then uses a python script to convert the output to a sequence of 0s and 1s

import sys
import os
import subprocess
import re


def clean_up():
    # delete text.asm
    os.remove('text.asm')
    # delete data.asm
    os.remove('data.asm')


# assemble the file
def assemble(filename):
    # the command to assemble the file
    command = f'spim -noexception -dump -f {filename}'
    # split the command by spaces
    command = re.split(r'\s+', command)
    # call spim
    subprocess.call(command)


def hex_to_binary(hex_value):
    # convert the hex to binary
    binary = bin(int(hex_value, 16))[2:].zfill(32)
    # return the binary
    return binary


# convert the text.asm to binary file
def convert(filename):
    binary_result = ''
    # open the file
    file = open('text.asm', 'r')
    # read the file
    lines = file.readlines()
    # close the file
    file.close()
    # loop through the lines
    for line in lines:
        # split the line
        line = re.split(r'\s+', line)
        # check if the line is empty
        if len(line) > 1:
            # if the file starts with [0x********] using a regex
            if re.match(r'\[0x[0-9a-fA-F]+\]', line[0]):
                # get the hex value
                hex_value = line[1]
                # remove the 0x from the hex
                hex_value = hex_value[2:]
                # add the binary to the result
                binary_result += hex_to_binary(hex_value) + '\n'
    return binary_result





# write the binary to a file
def write_to_file(filename, binary_result):
    binary_file = open(filename, 'w')
    binary_file.write(binary_result)
    binary_file.close()


if __name__ == "__main__":
    # check if the file exists
    if len(sys.argv) < 2:
        print("Error: no file specified")
        sys.exit(1)
    
    if not os.path.isfile(sys.argv[1]):
        print("Error: file does not exist")
        sys.exit(1)

    filename = sys.argv[1]
    
    # assemble the file
    assemble(filename)

    # convert the text.asm to binary
    binary_result = convert(filename)

    file_to_write = 'opcodes.bin'

    # write the binary to a file
    write_to_file(file_to_write, binary_result)

    # clean the temp files
    clean_up()

    # print the result
    print(f'The binary is written to {file_to_write}')
    
