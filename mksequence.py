# -*- coding: utf-8 -*-

import os, sys

try:
    unicode
    import codecs
    sys.stdout = codecs.getwriter('utf-8')(sys.stdout)
    def copen(fname, mode):
        return codecs.open(fname, mode, "utf-8")
except:
    def copen(fname, mode):
        return open(fname, mode, encoding='utf-8')

nuc_dir = "nucc"

def make_sequence_from_file(fname):
    fname = os.path.join(nuc_dir, fname)
    if not os.path.exists(fname):
        raise Exception("no %s file." % fname)
    last_line = None
    sequence = []
    with copen(fname, "r") as f:
        try:
            for line in f:
                uline = line
                if uline[0] == u'＠':
                    continue
                if uline[0] == u'F' or uline[0] == u'M':
                    if last_line is None:
                        last_line = uline
                        continue
                    else:
                        seq_input = last_line[5:-1]
                        seq_output = uline[5:-1]
                        last_line = uline
                        sequence.append((seq_input, seq_output))
                else:
                    last_line = None
        except:
            sys.stderr.write("skip %s (not euc-jp)\n" % fname)
            sys.stderr.flush()
            return []
    return sequence

def main():
    if not os.path.exists(nuc_dir):
        raise Exception("no extracted files.")

    files = os.listdir(nuc_dir)
    uniq_seq = {}
    for f in files:
        if not ".txt" in f:
            continue
        seq = make_sequence_from_file(f)
        for inp, out in seq:
            uniq_seq[inp] = out
    for k, v in uniq_seq.items():
        print("input: %s\noutput: %s" % (k, v))
    return


if __name__ == "__main__":
    main()
    sys.exit(0)
#
