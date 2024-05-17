import argparse
import os

from src.runner import run_eval

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    # data-related parameters
    parser.add_argument("-o", "--output_file", type=str, default="output")
    parser.add_argument("-q", "--questions_file", type=str, required=True)
    parser.add_argument("-n", "--num_questions", type=int, default=20)
    parser.add_argument("-db", "--db_type", type=str, default="postgres")
    
    args = parser.parse_args()

    run_eval(args)