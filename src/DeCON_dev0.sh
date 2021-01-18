#!/bin/bash
# DeCON_dev0 0.0.1
# Generated by dx-app-wizard.
#
# Your job's input variables (if any) will be loaded as environment
# variables before this script runs.  Any array inputs will be loaded
# as bash arrays.
#
# Any code outside of main() (or any entry point you may add) is
# ALWAYS executed, followed by running the entry point itself.

main() {

    echo "Meow"
    # echo "Value of bam_list: '$bam_list'"
    # echo "Value of target_bed: '$target_bed'"
    # echo "Value of ref_gen: '$ref_gen'"
    # echo "Value of exon_num: '$exon_num'"
    # echo "Value of custom_report: '$custom_report'"
    echo "Value of prefix: '$prefix'"
    echo "Value of mincorr: '$mincorr'"
    echo "Value of mincov: '$mincov'"
    echo "Value of trans_prob: '$trans_prob'"

    # To recover the original filenames, you can use the output of 
    # "dx describe "$variable" --name"

    if [ -n "$bam_list" ]
    then
        dx download "$bam_list" -o bam_list
    fi

    if [ -n "$target_bed" ]
    then
        dx download "$target_bed" -o target_bed
    # else # download the default
    #     dx download project-Fkp9vjj4YFK078JQ4pyb5Qy0:file-Fv2gVXj4YFKBF0v26f0G8vpP -o target_bed
    fi

    if [ -n "$ref_gen" ]
    then
        dx download "$ref_gen" -o ref_gen
    # else # download the default
    #     dx download project-F3zxk7Q4F30Xp8fG69K1Vppj:file-F403K904F30y2vpVFqxB9kz7 -o ref_gen
    fi

    if [ -n "$exon_num_tsv" ]
    then
        dx download "$exon_num_tsv" -o exon_num_tsv
    fi

    # Fill in your application code here.
    tar -xzvf decon.tar.gz decon/
    bash decon/setup.sh

    # The following line(s) use the dx command-line tool to upload your file
    # outputs after you have created them on the local file system.  It assumes
    # that you have used the output field name for the filename for each output,
    # but you can change that behavior to suit your needs.  Run "dx upload -h"
    # to see more options to set metadata.

    sample_coverage=$(dx upload sample_coverage --brief)
    failures=$(dx upload failures --brief)
    summary_RData=$(dx upload summary_RData --brief)
    CNV_calls=$(dx upload CNV_calls --brief)

    #     ,
    # {
    #   "name": "shiny_plot",
    #   "class": "file"
    # }
    # shiny_plot=$(dx upload shiny_plot --brief)

    # The following line(s) use the utility dx-jobutil-add-output to format and
    # add output variables to your job's output as appropriate for the output
    # class.  Run "dx-jobutil-add-output -h" for more information on what it
    # does.

    dx-jobutil-add-output sample_coverage "$sample_coverage" --class=file
    dx-jobutil-add-output failures "$failures" --class=file
    dx-jobutil-add-output summary_RData "$summary_RData" --class=file
    dx-jobutil-add-output CNV_calls "$CNV_calls" --class=file
    # dx-jobutil-add-output shiny_plot "$shiny_plot" --class=file
}
