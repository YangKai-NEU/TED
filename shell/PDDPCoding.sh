#!/bin/bash
cd /home/yangkai/plt/code
g++ -O3 e_pddp_coding.cpp -o e_pddp_coding

nodeFile=("/home/yangkai/plt/dataset/beijing/roadnetwork/WA_Nodes.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork/WA_Nodes.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_10/WA_Nodes.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_13/WA_Nodes.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_16/WA_Nodes.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_19/WA_Nodes.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_22/WA_Nodes.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_25/WA_Nodes.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_28/WA_Nodes.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_31/WA_Nodes.txt")

edgeFile=("/home/yangkai/plt/dataset/beijing/roadnetwork/WA_Edges.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork/WA_Edges.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_10/WA_Edges.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_13/WA_Edges.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_16/WA_Edges.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_19/WA_Edges.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_22/WA_Edges.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_25/WA_Edges.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_28/WA_Edges.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_31/WA_Edges.txt")

geoFile=("/home/yangkai/plt/dataset/beijing/roadnetwork/WA_EdgeGeometry.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork/WA_EdgeGeometry.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_10/WA_EdgeGeometry.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_13/WA_EdgeGeometry.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_16/WA_EdgeGeometry.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_19/WA_EdgeGeometry.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_22/WA_EdgeGeometry.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_25/WA_EdgeGeometry.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_28/WA_EdgeGeometry.txt"
"/home/yangkai/plt/dataset/singapore/roadnetwork_31/WA_EdgeGeometry.txt")

entryTable=("/home/yangkai/plt/index/beijing_edge2entry_table.txt"
"/home/yangkai/plt/index/singapore_edge2entry_table.txt"
"/home/yangkai/plt/index/singapore_edge2entry_table_10.txt"
"/home/yangkai/plt/index/singapore_edge2entry_table_13.txt"
"/home/yangkai/plt/index/singapore_edge2entry_table_16.txt"
"/home/yangkai/plt/index/singapore_edge2entry_table_19.txt"
"/home/yangkai/plt/index/singapore_edge2entry_table_22.txt"
"/home/yangkai/plt/index/singapore_edge2entry_table_25.txt"
"/home/yangkai/plt/index/singapore_edge2entry_table_28.txt"
"/home/yangkai/plt/index/singapore_edge2entry_table_31.txt")

formatedFile=("beijing_20" "beijing_40" "beijing_60" "beijing_80" "beijing_100" 
"beijing_1300_100" "beijing_1300_400" "beijing_1300_700" "beijing_1300_1000" "beijing_1300_1300" 
"beijing_insert_1" "beijing_insert_2" "beijing_insert_3" "beijing_insert_4" "beijing_insert_5" 
"singapore_20" "singapore_40" "singapore_60" "singapore_80" "singapore_100" 
"singapore_900_100" "singapore_900_300" "singapore_900_500" "singapore_900_700" "singapore_900_900" 
"singapore_insert_1" "singapore_insert_2" "singapore_insert_3" "singapore_insert_4" "singapore_insert_5" 
"beijing_threshold" "singapore_threshold")

entryBitNum=("3" "4" "4" "5" "5" "5" "5" "5" "5")
entryNum=("7" "10" "13" "16" "19" "22" "25" "28" "31")
thresholdValue=("1" "3" "5" "7" "9" "0.1")
select="all"

# four selections can be selected: length, number, threshold, insert, entry

for args in $@
do
	case "$args" in
		"length")
			if [[ $select == *beijing* ]]
			then
				for i in {5..9}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			elif [[ $select == *singapore* ]]
			then
				for i in {20..24}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			else
				for i in {5..9}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
				for i in {20..24}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			fi
			;;
		"number")
			if [[ $select == *beijing* ]]
			then
				for i in {0..4}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			elif [[ $select == *singapore* ]]
			then
				for i in {15..19}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			else
				for i in {0..4}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
				for i in {15..19}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			fi
			;;
		"threshold")
			if [[ $select == *beijing* ]]
			then
				for i in {0..5}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[30]}"
					lcodingFile+=".txt"
					lcodingFile=${lcodingFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[30]}"
					pddpindexFile+=".txt"
					pddpindexFile=${pddpindexFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[30]}"
					pddpcodingFile+=".txt"
					pddpcodingFile=${pddpcodingFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[30]}"
					timeFile+=".txt"
					timeFile=${timeFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			elif [[ $select == *singapore* ]]
			then
				for i in {0..5}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[31]}"
					lcodingFile+=".txt"
					lcodingFile=${lcodingFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[31]}"
					pddpindexFile+=".txt"
					pddpindexFile=${pddpindexFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[31]}"
					pddpcodingFile+=".txt"
					pddpcodingFile=${pddpcodingFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[31]}"
					timeFile+=".txt"
					timeFile=${timeFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			else
				for i in {0..5}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[30]}"
					lcodingFile+=".txt"
					lcodingFile=${lcodingFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[30]}"
					pddpindexFile+=".txt"
					pddpindexFile=${pddpindexFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[30]}"
					pddpcodingFile+=".txt"
					pddpcodingFile=${pddpcodingFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[30]}"
					timeFile+=".txt"
					timeFile=${timeFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
				for i in {0..5}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[31]}"
					lcodingFile+=".txt"
					lcodingFile=${lcodingFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[31]}"
					pddpindexFile+=".txt"
					pddpindexFile=${pddpindexFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[31]}"
					pddpcodingFile+=".txt"
					pddpcodingFile=${pddpcodingFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[31]}"
					timeFile+=".txt"
					timeFile=${timeFile/"threshold"/"threshold_${thresholdValue[$i]}"}
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			fi
			;;
		"insert")
			if [[ $select == *beijing* ]]
			then
				for i in {10..14}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			elif [[ $select == *singapore* ]]
			then
				for i in {25..29}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			else
				for i in {10..14}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
				for i in {25..29}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[$i]}"
					lcodingFile+=".txt"
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[$i]}"
					pddpindexFile+=".txt"
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[$i]}"
					pddpcodingFile+=".txt"
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			fi
			;;
		"entry")
			if [[ $select != *beijing* ]]
			then
				for i in {0..8}
				do
					lcodingFile="/home/yangkai/plt/result/l_coding/"
					lcodingFile+="${formatedFile[31]}"
					lcodingFile+=".txt"
					lcodingFile=${lcodingFile/"threshold"/"entry_${entryNum[$i]}"}
					pddpindexFile="/home/yangkai/plt/index/pddp_index/"
					pddpindexFile+="${formatedFile[31]}"
					pddpindexFile+=".txt"
					pddpindexFile=${pddpindexFile/"threshold"/"entry_${entryNum[$i]}"}
					pddpcodingFile="/home/yangkai/plt/result/pddp_coding/"
					pddpcodingFile+="${formatedFile[31]}"
					pddpcodingFile+=".txt"
					pddpcodingFile=${pddpcodingFile/"threshold"/"entry_${entryNum[$i]}"}
					timeFile="/home/yangkai/plt/recording/pddpcoding/"
					timeFile+="${formatedFile[$i]}"
					timeFile+=".txt"
					timeFile=${timeFile/"threshold"/"entry_${entryNum[$i]}"}
					echo $pddpcodingFile
					./e_pddp_coding $pddpindexFile $lcodingFile $pddpcodingFile $timeFile
				done
			fi
			;;
		"all" | "singapore" | "beijing")
			select="$args"
			;;
	esac
done

rm e_pddp_coding
