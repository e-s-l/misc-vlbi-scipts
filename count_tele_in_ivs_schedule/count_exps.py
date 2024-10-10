import sys
import re


def main():

    # counters
    total_counts = 0
    r_counts = 0  # ivs r experiments
    v_counts = 0  # vgos v experiments
    nn_counts = 0
    ns_counts = 0

    # no = not observed
    no_nn_counts = 0
    no_ns_counts = 0
    no_total_counts = 0

    # debug
    # confirm required file is supplied
    if len(sys.argv) != 2:
        print(f"Try: python {sys.argv[0]} <file>")
        sys.exit(1)

    # regex
    scheduled_stations_pattern = r'(?:[A-Z][a-z])+\s'
    # r'(?:[A-Z][a-z]{0,2}\d{0,1})+\s'
    #r'(?:[A-Z][a-z]|[A-z]\d)+\s'
    # r'(?:[A-Z][a-z])+\s'
    # r'\b(?:[A-Z][a-z])+\b'
    tele_patterns = r'(Nn|Ns)'
    experiment_code_patterns = r'\b[a-z]{1,3}\d{3,5}\b'

    # read
    with (open(sys.argv[1]) as input_file):

        for line in input_file:

            stations = re.findall(scheduled_stations_pattern, line)

            # this if is jUsT iN cASe
            if stations:

                # observed
                if re.findall(tele_patterns, stations[0]):

                    if 'Nn' in stations[0]:
                        nn_counts += 1
                        # debug, compare output to grep Nn master2023.txt...
                        # print(stations)

                    if 'Ns' in stations[0]:
                        ns_counts += 1

                    total_counts += 1

                    exp_code_match = re.findall(experiment_code_patterns, line)

                    if exp_code_match:
                        exp_code = exp_code_match[0]

                        if re.findall(r'r[a-z]{0,3}\d{3,5}', exp_code):
                            r_counts += 1
                        elif re.findall(r'v[a-z]{0,3}\d{3,5}', exp_code):
                            v_counts += 1

                # not observed
                if len(stations) > 1:
                    if re.findall(tele_patterns, stations[1]):

                        if 'Nn' in stations[1]:
                            no_nn_counts += 1

                        if 'Ns' in stations[1]:
                            no_ns_counts += 1

                        no_total_counts += 1

    stats = (f"-------\nOBSERVED COUNTS:\nTotal: {total_counts}\nR: {r_counts}\nVGOS: {v_counts}\n"
             f"Other: {total_counts - r_counts - v_counts}\nTelescope Counts:\nNN: {nn_counts}\nNS: {ns_counts}\n"
             f"NOT OBSERVED:\nTotal NO: {no_total_counts}\nNN NO: {no_nn_counts}\nNS NO: {no_ns_counts}\nSUM:\n"
             f"TELESCOPES TOTAL:\nNN_total: {nn_counts + no_nn_counts}\nNS_total: {ns_counts + no_ns_counts}")

    print(stats)

    with open("stats.txt", "a") as output_file:
        output_file.write(stats)


if __name__ == "__main__":

    main()
