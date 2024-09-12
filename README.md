# Genome-novelty
Calculates novelty of a genome at different taxonomic levels against a reference database

Add usage

The input data for this script is the output results from https://github.com/Ecogenomics/GTDBTk with the first line removed and should look something like this:
``
AcS1-36 d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__UBA184;f__UBA184;g__;s__    N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__;f__;g__;s__    taxonomic novelty determined using RED   N/A     N/A     59.47   11      0.8688964603554084      N/A
AcS1-67 d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__UBA184;f__UBA184;g__;s__    N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__;f__;g__;s__    taxonomic novelty determined using RED   N/A     N/A     71.06   11      0.8512999587089696      N/A
AcS1-45 d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__UBA184;f__UBA184;g__;s__    N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__;f__;g__;s__    taxonomic novelty determined using RED   N/A     N/A     70.2    11      0.8471576717763797      N/A
AcS3-69 d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__UBA184;f__UBA184;g__;s__    N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__;f__;g__;s__    taxonomic novelty determined using RED   N/A     N/A     36.28   11      0.8254744370238131      N/A
AcS2-54 d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__UBA184;f__UBA184;g__;s__    N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__;f__;g__;s__    taxonomic novelty determined using RED   N/A     N/A     41.06   11      0.8193957327220813      N/A
AcS5-116        d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__UBA184;f__UBA184;g__;s__    N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__;f__;g__;s__     taxonomic novelty determined using RED  N/A     N/A     86.48   11      0.8188046907215639      N/A
AcS3-62 d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__UBA184;f__UBA184;g__;s__    N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__;f__;g__;s__    taxonomic novelty determined using RED   N/A     N/A     89.85   11      0.8129522034452954      N/A
AcS5-109        d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__UBA184;f__UBA184;g__;s__    N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__;f__;g__;s__     taxonomic novelty determined using RED  N/A     N/A     39.32   11      0.8104096085393477      N/A
AcS5-107        d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__UBA184;f__UBA184;g__;s__    N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     N/A     d__Archaea;p__Thermoplasmatota;c__Thermoplasmata;o__;f__;g__;s__     taxonomic novelty determined using RED  N/A     N/A     88.93   11      0.8087285174786798      N/A
``
We have previded an example input file in "Example.input"

Add description of output files: tax.novelty.50pcNovelty,  tax.novelty.75pcNovelty, tax.novelty.stats, tax.novelty.nwk

NOTE: Input data should be analysed with te same version of GTDB as the reference database, as GTDB taxonomic names can change between versions.
