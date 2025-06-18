# Credit Card Fraud Detection using R

A comprehensive data science project that implements machine learning algorithms to detect fraudulent credit card transactions using R programming language.

## 📊 Project Overview

This project analyzes credit card transaction data to build predictive models that can identify fraudulent transactions. The implementation includes data preprocessing, handling class imbalance, and building decision tree models for fraud detection.

## 🎯 Objectives

- Analyze credit card transaction patterns
- Handle highly imbalanced dataset (fraud vs legitimate transactions)
- Implement various sampling techniques to improve model performance
- Build and evaluate decision tree models for fraud detection
- Achieve optimal balance between precision and recall

## 📁 Project Structure

```
credit-card-fraud-detection/
│
├── Code.R          # Main R script with complete analysis
├── creditcard.csv              # Dataset (not included - see Data section)
├── README.md                   # Project documentation
└── requirements.txt            # R packages required
```

## 🔧 Technologies Used

- **R Programming Language**
- **Libraries:**
  - `caret` - Classification and Regression Training
  - `dplyr` - Data manipulation
  - `ggplot2` - Data visualization
  - `caTools` - Data splitting
  - `ROSE` - Random Over/Under-Sampling Examples
  - `smotefamily` - SMOTE implementation
  - `rpart` - Decision trees
  - `rpart.plot` - Decision tree visualization

## 📈 Dataset

The project uses a credit card transactions dataset with the following characteristics:

- **Features:** 30 anonymized features (V1-V28, Time, Amount)
- **Target:** Class (0 = Legitimate, 1 = Fraud)
- **Size:** ~284K transactions
- **Imbalance:** Highly imbalanced (~0.17% fraud cases)

### Data Source
The dataset should be placed in the project directory as `creditcard.csv`. You can obtain similar datasets from:
- [Kaggle Credit Card Fraud Detection Dataset](https://www.kaggle.com/mlg-ulb/creditcardfraud)

## 🔄 Methodology

### 1. Data Exploration
- Dataset structure analysis
- Missing value detection
- Class distribution visualization
- Statistical summary

### 2. Data Preprocessing
- Factor conversion for target variable
- Data sampling for computational efficiency
- Train-test split (80-20)

### 3. Handling Class Imbalance
Multiple techniques implemented:

#### Random Over-Sampling (ROS)
- Increases minority class samples
- Balances dataset to 50-50 distribution

#### Random Under-Sampling (RUS)
- Reduces majority class samples
- Risk of information loss

#### Combined Sampling (ROS + RUS)
- Hybrid approach for optimal balance

#### SMOTE (Synthetic Minority Oversampling Technique)
- Generates synthetic fraud examples
- Preserves data characteristics
- Best performing technique

### 4. Model Building
- **Algorithm:** Decision Trees (CART)
- **Implementation:** rpart package
- **Evaluation:** Confusion Matrix, Accuracy, Precision, Recall

## 🚀 Getting Started

### Prerequisites
```r
# Install required packages
install.packages(c("caret", "dplyr", "ggplot2", "caTools", 
                   "ROSE", "smotefamily", "rpart", "rpart.plot"))
```

### Installation
1. Clone the repository:
```bash
git clone https://github.com/yourusername/credit-card-fraud-detection.git
cd credit-card-fraud-detection
```

2. Download the dataset and place it as `creditcard.csv` in the project directory

3. Update the file path in the R script:
```r
creditcard <- read.csv("path/to/your/creditcard.csv")
```

### Running the Analysis
```r
# Run the complete analysis
source("DS course Project.R")
```

## 📊 Results

### Model Performance Comparison

| Technique | Accuracy | Precision | Recall | F1-Score |
|-----------|----------|-----------|--------|----------|
| No Sampling | High | Low | Very Low | Poor |
| SMOTE | Balanced | Good | Good | Best |
| ROS | Moderate | Moderate | High | Good |
| RUS | Variable | Variable | High | Moderate |

### Key Findings
- SMOTE technique provides the best balance between precision and recall
- Decision trees effectively capture fraud patterns
- Proper sampling is crucial for imbalanced datasets
- Feature engineering on anonymized data shows promising results

## 📈 Visualizations

The project includes several visualizations:
- Pie chart showing class distribution
- Scatter plots comparing sampling techniques
- Decision tree visualizations
- Confusion matrices for model evaluation

## 🔍 Future Improvements

- [ ] Implement additional algorithms (Random Forest, SVM, Neural Networks)
- [ ] Feature engineering and selection
- [ ] Cross-validation for robust evaluation
- [ ] ROC-AUC analysis
- [ ] Real-time prediction capability
- [ ] Web application interface

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [Your LinkedIn](https://linkedin.com/in/yourprofile)
- Email: your.email@example.com

## 🙏 Acknowledgments

- Dataset providers for making fraud detection research possible
- R community for excellent packages and documentation
- Kaggle for hosting similar datasets and competitions

## 📞 Contact

For questions, suggestions, or collaborations, please reach out through GitHub issues or email.

---

⭐ **Star this repository if you found it helpful!** ⭐
