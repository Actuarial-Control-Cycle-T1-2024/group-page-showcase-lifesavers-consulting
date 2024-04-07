# SOA 2024: Health Incentive Plan

Team: Lifesavers Consultancy

Members: Jason Lim, Dongjin Youn, Zihao Zhou, Manjot Singh, Michael Trinh

The main report can be found below, with references to the accompanying code and appendices. For the pdf of the full report, click [here](<Lifesavers Consultancy Proposal Report.pdf>).

If you would like to see the main report in its website form, please click [here](https://actuarial-control-cycle-t1-2024.github.io/group-page-showcase-lifesavers-consulting/).

---

## Problem Statement
SuperLife, a major life insurance provider in Lumaria is exploring the integration of targeted health incentives with its longer-term life insurance offerings to maintain its competitive advantage within a data-driven society. The company’s internal product team has conducted extensive research on both internal and external data and proposed a possible solution. To  ensure the feasibility and unbiased evaluation, SuperLife has requested LifeSavers Consultancy to independently assess the market domain.

## Objectives
As claims payments hold the largest contribution toward the cost for insurers, the implementation of health incentives that reduce the mortality rates for policyholders is critically investigated. Thus, our goal is to provide a program that can be deployed simultaneously with SuperLife’s insurance policy to reduce the mortality rate by fostering the healthy behaviour of the insured. Thereupon the successful implementation of the program, SuperLife will benefit through an increase in profitability and market exposure.

## Program Design
### Preliminary Analysis
To better understand the market domain that SuperLife is operating within, we have investigated the contextual background of Lumaria to tailor our solution to meet the customers' needs. Our team began research by analysing the annual income distribution, as well as GDP per capita which translates to 26,806 USD as of the 2023 estimate. The following figures indicate that their economic status is comparable to countries such as Argentina with similar GDP per capita which will serve as a benchmark. 

Furthermore, employment distribution data with 12% in agriculture, 35% in industry, and 53% in service shares a similar proportion with emerging countries such as China, Turkey, and Indonesia, which served as a critical indicator for our solution. Based on the comparison, our team has rejected the implementation of health incentives which solely rely on high upfront costs for policyholders, leading to more robust program design.

From the [inforce dataset](2024-srcsc-superlife-inforce-dataset-part1.csv), we found the following key facts:

- SuperLife issues whole life insurance to people aged 35-65 (left-skewed).
- SuperLife issues 20-year term insurance to people aged 26-55 (left-skewed).
- The cause of death between smokers and non-smokers has huge discrepancies, as seen in [Appendix A](<Appendices/Appendix A.png>), and thus must be considered separately.
- The distribution channel has no effect on the underwriting class, as seen in [Appendix B](<Appendices/Appendix B.png>), thus does not need to be considered in our investigations.

### Program Description
SuperLife’s main concern is regarding the improved mortality rate of their policyholders after purchasing the whole and term life insurance products. Recognising that a healthier lifestyle directly correlates with longevity, our team has devised an innovative approach to reward policyholders for adopting and maintaining healthy habits. Our new program aims to incentivise policyholders to live healthily by offering predetermined discounts through a cashback application that we’d develop for users to utilise whenever they participate in scheduled intervention programs or utilise designated health services through partnered retailers/institutions. Our team is looking to specifically lowering the mortality of smokers, as mortality rates increases significantly as the age group increases.

### Intervention Programs
Intervention programs are health initiatives targeted to reducing mortality rates through educating and providing medical assistance for policyholders. To ensure equitable distribution of rewards and encourage continuous improvement in health behaviours, policyholders are first stratified into distinct tiers based on various health-related factors, mainly age group and smoking status. When assessing the possible intervention programs to invest in the proposed system, LifeSavers Consultancy grouped them into 3 categories: high effect (at least a 6% mortality reduction), moderate effect (between 3-6%) and low effect (2-4%). It was decided to select 3 programs in each tier to allow a diverse range of policyholders to participate. 

After thoroughly analysing the most frequent death causes of policyholders within the last 20 years (see [Appendix A](<Appendices/Appendix A.png>)), it was discovered that cancer and heart or circulatory system disease were the top two leading causes of death. Considering this, as well as how different programs would have different effects based on smoking status and age, Lifesavers Consultancy critically selected the 9 intervention programs that the firm recommends that SuperLife 
focuses on, as shown below:

- High Effect (6%+ mortality reduction):
   - Weight Management Programs
   - Heart Health Screenings
   - Cancer Prevention Initiatives
- Moderate Effect (3-6% mortality reduction):
   - Fitness Tracking Incentives
   - Holistic Stress Reduction
   - Alcohol Moderation Programs
- Low Effect (2-4% mortality reduction):
   - Educational Workshops
   - Driving Safety Courses  
   - Incentives for Regular Medication Adherence
  
A detailed table explaining the choice of the intervention programs, as well as the mortality 
reduction effects can be seen in [Appendix C](<Appendices/Appendix C.png>).

### Cashback Logistics
Each tier is associated with different discount levels based on the estimated reduction in mortality, ensuring that rewards are tailored towards individual circumstances. The following tiered approach encourages policyholders to strive for healthier lifestyles, as those who exhibit positive health behaviours, participate in the high effect intervention program and thus, have the highest reduction in mortality are eligible for more substantial cashback 
discounts.

Regular annual evaluation, analysis of policyholders’ transitions through tiers and monitoring of the program's effectiveness will be conducted to assess its impact on policyholder health outcomes and insurance risks, aiming for long-term improvements in policyholder health and mortality, as well as reduced insurance risks and costs for SuperLife.

### Product Timeline

![](<Images and Tables/Product Timeline.png>)

As demonstrated in Lifesavers Consultancy’s product timeline, between September and October 2024, efforts will concentrate on forging partnerships with retailers and wellness activity providers, laying the groundwork for collaboration. Following this, from October-December 2024, the focus will shift to the design, development, and internal testing of the application. Additionally, November 2024 will see a regulatory compliance review to ensure adherence to necessary standards. 

The initiation of marketing endeavours, utilising TV advertisements and direct email campaigns to inform current policyholders about the pilot launch of the program and providing specialised training to retail partners and wellness activity providers will start a month later. Pilot launch is scheduled from January 2025 to July 2025, targeting a selected 30% of current policyholders.

Also, throughout March and July 2025, quarterly reports will be monitored to gauge profitability based on data obtained from program engagement with retailers and wellness activity providers. Adjustments will then be made in April and August 2025 based on data analysis. During that time, in July 2025, a comprehensive report on the program's performance will be delivered to stakeholders. 

Full deployment of the program is set from August 2025 to July 2040 while monitoring of Key Performance Indicators (KPIs) will be conducted quarterly, with annual reports assessing effectiveness and outreach. Marketing strategies will also be adjusted every two years based on relevance, with periodic reviews assessing long-term impact. Lastly, every five years, the program's retention rate will undergo evaluation to withdraw irrelevant programs. 

With the above product timeline in mind, the short-term timeframe for the evaluation of this program will be from 2025 to 2040 as the full deployment will allow SupeLife to gather enough data to evaluate the success of the program in reducing mortality. The long-term timeframe will be from 2025-2055 as this will allow SuperLife enough time to optimise the program and re-evaluate objectives.

## Assumptions

![](<Images and Tables/Assumptions.png>)

## Pricing and Costs
### Modelling Program Participation [[code](Transition-modelling.r)]
To emulate the policyholder’s behaviour and their participation in the program, our team has segmented the population into 4 groups driven by their reduction in mortality due to their participation in health incentives. The four groups are defined as "High Impact", "Moderate Impact", "Low Impact", and "No Participation” groups with assumptions of 7.5%, 5%, 2.5% and 0% reduction in mortality respectively. Furthermore, this group will act as states of the Markov Chain to simulate both short-term behaviours when the program is deployed as well as long-term distribution amongst the group incorporating diminishing effects as well. 

The transition rate amongst the states is initially estimated backed by critical research of literature reviews. Yet, it is a sole assumption in the program development phase and Lifesavers Consultancy aims to continuously modify and update the model during SuperLife’s deployment of the program to retrieve relevant data. The transition rates are defined as below:

![](<Images and Tables/Transition Matrix.png>)

Based on the initial conjecture provided above, Lifesavers Consultancy will continue investigation into the dynamic participation rate and population distribution amongst different states as the programs are deployed. The visualisation is provided below.

![](<Images and Tables/Simulation.png>)

As demonstrated through the visualisation, all policyholders are assumed to begin in the full participation state and the distribution changes as time progresses. It is important to note for the long-term prediction over the 20-30-year period the distribution stabilises, and the corresponding figures are used for our future projections.

### Interest Rate Projection [[code](<interest rate forecasting.R>)]
Proven from precedent literature reviews, the Autoregressive Integrated Moving Average (ARIMA) model has shown its effectiveness in forecasting inflation and interest rates in future using past datasets. The modelling can be seen in [Appendix E](<Appendices/Appendix E.png>) and [F](<Appendices/Appendix F.png>). From the model, it can be derived that the long-term interest rate is 4.85% p.a., which will be integrated in Lifesavers Consultancy’s pricing model. 

### Mortality Saving [[code](<4001 code Zihao.r>)]
The mortality savings are calculated through the implementation of Lifesavers Consultancy’s intervention program on the already existing inforce dataset with a 20-year interval from the year 2004 to 2023. Using the inforce data set, the policyholders are grouped into age groups from 21-30, 31-40, 41-50 and onwards, and then further grouped by their smoking status. Smoking status is an important factor due to the mortality of smokers being drastically 
different from non-smokers (0.39 vs 0.03 for aged 61-70), especially in older age groups as indicated in [Appendix G](<Appendices/Appendix G.png>).

The total death benefit payouts before the implementation of Lifesavers Consultancy’s program are calculated (see more details in [Appendix H](<Appendices/Appendix H.png>)) using:
```math 
\begin{multline}
\text{total payout per year}
            = \text{probability of death of smokers} \times \text{percentage of age group}
            \times \text{policyholders each year} \times \text{percentage of smokers} \times \text{mean face amount}
\end{multline}
```

The calculation of total death benefit payouts with the implementation of the intervention program requires the probability transition matrix presented above, with the long-run proportions (approximated to 1dp) being 6.5%, 19.3%, 32.3% and 41.9% in the high, moderate, low and no effect tiers respectively. 

The reduction in mortality from the intervention program will be very effective at the start of the program, and as the lifestyle improves for the policyholders, the reduction in mortality will taper off to the long-run reduction calculated using the proportions above and short-run reduction as shown in [Appendix I](<Appendices/Appendix I.png>). Furthermore, since data for the yearly reduction of smokers are not given, we decided to conservatively assume a 1% decrease in the number of smokers annually under our program (CDC, 2022). With the above information, we can then repeat the same process and incorporate the reduction in mortality. 

The results show that with the implementation of the program, the mortality will have a 7.1% reduction in the long-term (15+ years) and a short-term reduction (1-15 years) of 10-22% for non-smokers, and 7.6% long-term and 8-23.5% short-term reduction for smokers. The reduction in mortality subsequently results in mortality savings of an average of 15.2% annually shown in Figure 1. The comparison of the costs can be seen in the diagram in [appendix K](<Appendices/Appendix K.png>). [[calculations](<mortality cost past 20 years & sensitivity test.xlsx>)]

![](<Images and Tables/Mortality Savings Past.png>)

This mortality saving can be projected into the future (20-year projection), using linear regression to project new policyholders and mortality projections given in the mortality table. As shown in [Appendix L](<Appendices/Appendix L.png>), SuperLife, using our intervention program will still maintain a positive mortality saving to an even greater extent, due to higher numbers of policyholders resulting in more savings from intervention reducing mortality costs by 17.4% average annually. [[calculations](<mortality cost payout projection & sensitivity test.xlsx>)]

### Premium Pricing [[calculations](<Cost Savings Manjot.xlsx>)]
To calculate the economic benefits of the proposed product, the policyholders were split into four groups, which were:
1. Non-smokers, whole life
2. Non-smokers, 20-year term
3. Smokers, whole life
4. Smokers, 20-year term

First, the cost of the policies without the program were calculated. Life tables of non-smokers and smokers were first constructed respectively. To produce the life table for non-smokers, the mortality data provided was used, while for smokers, a loading factor, as can be seen in [Appendix M](<Appendices/Appendix M.png>), was added to the mortality data, and the age limit was set to 100. To get the cost of each policy, assumptions around the cost per policy were used. Also, the modelled interest rate of 4.85% p.a. was used, as well as a 1% lapse rate, gathered from the inforce dataset (see [Appendix N](<Appendices/Appendix N.png>)).

Then, the cost of the policies with the program were calculated. This was done by estimating the costs of the intervention programs as part of the product, and then calculating the cost of a reasonable cashback. This was then multiplied by the long-term transition probabilities, to predict the proportion of people we would be giving cashback to. The cost of the cashback was split evenly between each policyholder, despite the policy conditions, as any policyholder would be given the same amount of cashback. This cashback would be funded by a reduction in mortality and this factor was predicted to be, using the long-term transition probabilities, ~93% for non-smokers, and ~92.5% for smokers. 

Now, using the demographic of policyholders given in the dataset, it was calculated that the average savings SuperLife would have made per policy would have been 2.5% with the proposed product, if it had been implemented 20 years ago. This would have allowed SuperLife to either reduce premiums, or maintain the same level of premiums, and have 2.5% more margin per policy. Projecting into the future for 20 years, there is a trend in the proportion of sum insured, seen in [Appendix O](<Appendices/Appendix O.png>), and it was calculated that if this trend continues, that SuperLife will save up to 3-4% per policy on average. 

## Risk and Risk Mitigation
The program risk map displays the most likely and impactful risk we identified for this project. Since these risks can greatly affect mortality savings, profitability and longevity of 9 policyholders, they must be identified and mitigated so that benefits of our product are not diminished. 

![](<Images and Tables/Risk Map.png>)

1. Catastrophe risk (quantifiable): unexpected natural disasters or a deadly pandemic will dramatically increase the mortality of all policyholders, which increases the potential payout and cost of our product. This risk can be mitigated either through transferring it to a disaster reinsurance pool or through exclusions of catastrophe related claims
2. Liquidity risk (quantifiable): life insurance claims require adequate reserves to cover potential claims. This risk can be mitigated by frequent reviewing of cash flow projections, mortality rates etc. This is included in the maintenance cost of the products and is transferred as a premium expense loading to further mitigate this risk. Furthermore, consistent scenario testing can also reduce this risk. 
3. Level risk (quantifiable): if the actual mortality rate is lower than expected, it will affect the total death benefit paid out which reduces the savings created by our program. Risk is mitigated by carefully considering the policyholder’s health and lifestyle conditions such as their age and smoking status. Furthermore, the design of our program is targeted at reducing mortality, which will reduce the level risk.
4. Inflation Risk (quantifiable): consistent high inflation will increase the cost of our intervention programs which will affect the financial benefits our product will bring to Superlife. To mitigate this risk, inflation rate and related macroeconomic factors must be closely monitored and if there is an upward trend of inflation, pricing of the premiums needs to be reassessed.
5. Dishonest policyholders (qualitative): smokers may lie about their smoking status to enjoy high discounts and lower premiums which may result in higher-than-expected mortality payout. To combat individuals falsely identifying as non-smokers, we would run an investigation when a claim is made and void the payout if they have committed fraud.
6. Behavioural trends/policy changes (qualitative): increased popularity in harmful trends such as vaping and changes in taxation on harmful products such as alcohol cigarettes can result in deviations from projected mortality rates. To mitigate this risk, it is important to constantly update risk profiles and review policy changes. Our product design also mitigates this risk as we incentivise a healthy lifestyle which can lower the risk of policyholders developing harmful behaviour trends. 

### Scenario Testing
_Smoker Quit Rate_

According to external studies (CDC, 2022) on the annual quit rate of smokers, the average annual rate of reduction for smokers is 1% to 7.5%. Therefore, we used a conservative assumption of using the worst-case scenario which yields a mortality cost saving in the pricing/cost section. 

_Mortality Reduction_

We calculated the mortality using the median of the range from the intervention data and increased the reduction of certain programs as we believed they would be more effective in reducing smokers’ mortality. By scenario testing with the low-end mortality reduction (5% reduction for high tier, 3% reduction for moderate tier and 2% for low tier), our intervention program still yields a 10% average annual mortality saving which is equal to the ideal profit margin. For the projected mortality saving, the program, in the worst-case scenario will produce a 12.4% annual savings in mortality payments. An example of the effects of lowered reduction is indicated in [Appendix L](<Appendices/Appendix L.png>). Therefore, to be conservative, the financial viability range for program mortality reduction is 6-10% for high tier, 3-8% for moderate tier, and 2-4% for low tier. Overall, due to the accuracy of our mortality reduction simulation, combined with the conservative assumptions, there is a 90% certainty that the mortality will decrease and create mortality savings as a result of our program.

In addition, the SuperLife consultancy has incorporated the multiplicative effects of the intervention programs by using:
```math
(1 - \text{reduction in mortality})^\text{number of interventions}
```
Considering the conjunction effect of interventions rather than simple addition which is not an accurate demonstration of real-life scenarios.

_Transition Probability_

The long-run transitional probabilities to each tier of our product are contingent on external studies and research, if the rate of participation is lower than expected, then it will negatively impact SuperLife’s mortality saving. By scenario testing lower participation rates, we found that the viable range for scenario tests are 30%-100% to achieve a significant amount of mortality saving (10%). However, the Monte Carlo simulation used during calculating mortality savings produces reliable results through 50 repetitions so participation rate falling below 30% is unlikely. 

_Interest Rate_

By modifying the interest rate assumption, Lifesavers Consultancy found that there was little impact on the total profits. It can be said that with 95% certainty, SuperLife will make at least an additional 2% of profit by implementing this program. 

# Data and Data Limitations

![](<Images and Tables/Data Limitations.png>)

# Further Recommendations
Lifesavers consultancy has illustrated several scenarios and projections for SuperLife with a cashback program design and assumptions table that are both heavily grounded in rational actuarial judgement. 

_Data Gathering_

Even though the assumptions and modelling may have a slight margin of error due to the lack of historical data provided, our simulations established that we’ve constructed a program that contains a high-level of certainty to increase future savings for SuperLife insurance whilst simultaneously being able to decrease expected mortality in policyholders. However, this requires regular monitoring, feedback and reviewing for the program to be truly successful and in turn, future data can be utilised to fulfil the margin of error, increasing accuracy.

_Application Implementations_

A key future concern for SuperLife is retaining policyholders to continue participating and demonstrating these healthier lifestyle habits. Gamifying through objectives and adding the ability to interact with peers through the application would enhance policyholders’ user experience, making it more enjoyable, competitive and sociable to participate in. An app demo is seen in Figure 2. Ultimately, our team’s goal transcends just mortality reduction and cost saving; it also encompasses the holistic well-being of SuperLife's policyholders.

![](<Images and Tables/Gamification.png>)

_Data Protection_

As the program expand out into a digital space and SuperLife is collecting more of policyholder’s information, it is integral to protect the policyholder’s data safely and securely. As such, we aim to implement cloud computing system and utilise VPN and segregation of access theory to SuperLife organisation, protecting trust and maintaining integrity of the firm.

# References
References
Centers for Disease Control and Prevention (2020). Smoking Cessation: Fast Facts. [online] Centers for Disease Control and Prevention. Available at: https://www.cdc.gov/tobacco/data_statistics/fact_sheets/cessation/smoking-cessation-fast-facts/index.html.

Francis, D. (2002). Why do Death Rates Decline? [online] NBER. Available at: https://www.nber.org/digest/mar02/why-do-death-rates-decline.

Kunz, R. (2022). The ideal profit margin for an independent insurance agency. [online] www.siaaz.com. Available at: https://www.siaaz.com/blog/ideal-profit-margin-independent-insurance-agency#:~:text=Taking%20these%20factors%20into%20consideration.

Life Insurance Direct Australia. (2024). Seniors Life Insurance in Australia. [online] Available at: https://www.lifeinsurancedirect.com.au/life-insurance/guides/seniors/

Martin, A. (2023). What Is The Age Limit For Life Insurance In 2024? [online] Choice Mutual. Available at: https://choicemutual.com/blog/life-insurance-age-limit/

Rabbi, A.M.F. and Mazzuco, S. (2020). Mortality Forecasting with the Lee–Carter Method: Adjusting for Smoothing and Lifespan Disparity. European Journal of Population. doi:https://doi.org/10.1007/s10680-020-09559-9.

Rising inflation and interest rates negatively impacted insurers’ underwriting and investment performance in 2022. (n.d.). Available at: https://www.oecd.org/daf/fin/private-pensions/GIMT-Preliminary-2022.pdf.

Roberts-Grey, G. (2022). Life Insurance: How Much Does Age Raise Your Rate? [online] Investopedia. Available at: https://www.investopedia.com/articles/personal-finance/022615/how-age-affects-life-insurance-rates.asp.

stats.oecd.org. (n.d.). Gross claims payments. [online] Available at: https://stats.oecd.org/Index.aspx?DataSetCode=PT7

www.scirp.org. (n.d.). Hyndman, R.J. and Khandakar, Y. (2008) Automatic Time Series Forecasting The Forecast Package for R. Journal of Statistical Software, 27, 1-22. -References - Scientific Research Publishing. [online] Available at: https://www.scirp.org/reference/ReferencesPapers?ReferenceID=2096093

www.ey.com. (n.d.). How insurers are managing liquidity risks in a volatile market. [online] Available at: https://www.ey.com/en_au/insurance/how-insurers-are-managing-liquidity-risks-in-a-volatile-mark
