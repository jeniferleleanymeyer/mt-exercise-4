import csv
import matplotlib.pyplot as plt

def main():
    post23 = []
    pre23 = []
    baseline = []
    post = []
    pre = []

    with open('scripts/numbers_2023/post_ppl_2023.txt', 'r', encoding="utf-8") as infile1:
        for line in infile1:
            post23.append(float(line[100:106].lstrip()))
    
    with open('logs/deen_transformer_post/err', 'r', encoding="utf-8") as file1:
        for line in file1:
            if 'ppl:' in line:
                post.append(float(line[100:106].lstrip()))

    with open('scripts/numbers_2023/pre_ppl_2023.txt', 'r', encoding="utf-8") as infile2:
        for line in infile2:
            pre23.append(float(line[100:106].lstrip()))

    with open('logs/deen_transformer_pre/err', 'r', encoding="utf-8") as file1:
        for line in file1:
            if 'ppl:' in line:
                pre.append(float(line[100:106].lstrip()))

    with open('scripts/numbers_2023/baseline_ppl_2023.txt', 'r', encoding="utf-8") as infile3:
        for line in infile3:
            baseline.append(float(line[100:106].lstrip()))
    
    j = len(post)
    k = len(pre)
    steps = []
    for i in range(len(post23)):
        steps.append((i+1)*500)
        if i >= j:
            post.append(None)
        if i >= k:
            pre.append(None)

    plt.plot(steps, pre23, label='pre-normalisation 2023')
    plt.plot(steps, post23, label='post-normalisation 2023')
    plt.plot(steps, pre, label='pre-normalisation')
    plt.plot(steps, post, label='post-normalisation')
    plt.plot(steps, baseline, label='baseline')
    plt.title('numbers from last year')
    plt.xlabel('epoch')
    plt.ylabel('valid. perplexity')
    plt.legend(loc='upper right')
    plt.savefig('results/line_chart.png')

    header = ['validation perplexity', 'baseline', 'prenorm 2023', 'postnorm 2023', 'prenorm', 'postnorm']
    with open('results/ppl_table.csv', 'w', encoding="utf-8") as outfile:
        writer = csv.writer(outfile)
        writer.writerow(header)
        for i in range(len(steps)):
            line = [steps[i], baseline[i], pre23[i], post23[i], pre[i], post[i]]
            writer.writerow(line)

    return

if __name__ == '__main__':
    main()