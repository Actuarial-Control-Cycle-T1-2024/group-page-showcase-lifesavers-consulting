
# Define the states
states <- c("High Impact", "Moderate Impact", "Low Impact", "No Participation")

# Define the transition probabilities by assumption
transition_probs <- matrix(c(
  0.7, 0.2, 0.1, 0.0,
  0.1, 0.6, 0.2, 0.1,
  0.0, 0.2, 0.6, 0.2,
  0.0, 0.0, 0.2, 0.8
), nrow = 4, byrow = TRUE)

# Create the transition matrix
transition_matrix <- as.data.frame(transition_probs, row.names = states, stringsAsFactors = FALSE)
colnames(transition_matrix) <- states

# Print the transition matrix
print(transition_matrix)


run.mc.sim <- function( P,   # probability transition matrix
                        num.iters=50, 
                        num.chains=150 )
{
  
  # number of possible states
  num.states <- nrow(P)
  
  # states X_t for all chains
  states     <- matrix(NA, ncol=num.chains, nrow=num.iters)
  
  # probability vectors pi^n through time
  all_probs  <- matrix(NA, nrow=num.iters, ncol=num.states)
  
  # forces chains to start in state 1
  pi_0      <- c(0,0,0,1)
  
  # initialize variables for first state 
  P_n           <- P
  all_probs[1,] <- pi_0
  states[1,]    <- 1
  
  for(t in 2:num.iters) {
    
    # pi^n for this iteration
    pi_n           <- pi_0 %*% P_n
    all_probs[t,]  <- pi_n
    
    for(chain_num in seq_len(num.chains)) {
      # probability vector to simulating next state 
      p                     <- P[ states[t-1,chain_num], ]
      states[t,chain_num]   <- which(rmultinom(1, 1, p) == 1)
    }
    
    # update probability transition matrix
    P_n           <- P_n %*% P
  }
  return(list(all.probs=all_probs, states=states))
}

sim1 <- run.mc.sim(transition_probs)

all.probs <- sim1[[1]]
matplot(all.probs, type='l', col=1:4, lty=1, ylab='probability', xlab='time')
legend('topright', c("High Impact", "Moderate Impact", "Low Impact", "No Participation"), lty=1, col=1:4,cex=1.5)


distribution <- sim1$all.probs

View(distribution)

result_matrix <- matrix(0, ncol = 4, nrow = 50)

nrow(sim1$all.probs)

# Loop through each row
for (i in 1:nrow(sim1$all.probs)) {
  # Multiply 0.075 to v1, 0.05 to v2, 0.035 to v3, and 0 to v4
  result_matrix[i, 1] <- 0.075 * distribution[i, 1]
  result_matrix[i, 2] <- 0.05 * distribution[i, 2]
  result_matrix[i, 3] <- 0.035 * distribution[i, 3]
  result_matrix[i, 4] <- 0 * distribution[i, 4]
}

# Print the resulting matrix
reduction <- rowSums(result_matrix)
View(reduction)
#* assumptions:
#* 
#* 1. Assumption: Sustained Effect:
#     * Some interventions maintain their impact consistently over time. For instance:
#         * A vaccination program may continue to protect individuals against a specific disease.
#         * Regular exercise might have a steady positive effect on health outcomes.
#     * Reference: Transient study of Markov models with time-dependent transition rates discusses modelling time-dependent rates in various contexts.
# 2. Assumption: Diminishing Returns:
#     * Interventions with high initial impact may experience diminishing returns. Initially, they lead to substantial improvements, but over time, the incremental benefit decreases.
#     * For example, a new drug may dramatically reduce mortality initially, but its effectiveness might plateau.
#     * Reference: Estimating Markov Transition Matrices Using Proportions Data explores credit risk models with time-dependent transition rates.
# 3. Assumption: Adaptive Behavior:
#     * Individuals may adapt their behaviour based on interventions. For instance:
#         * Awareness campaigns might lead to healthier lifestyle choices initially, but people may revert to old habits.
#         * Economic incentives (e.g., subsidies for healthy foods) may influence behaviour temporarily.
#     * Reference: Markov Analysis – A Brief Introduction discusses assumptions related to transitions.
# 4. Assumption: Lagged Effects:
#     * Some interventions may have delayed effects. Consider:
#         * Smoking cessation might take years to significantly reduce mortality.
#         * Environmental policies may impact health outcomes after a lag.
#     * Reference: A Procedure for Deriving Formulas to Convert Transition Rates provides formulas for converting rates.
# 5. Assumption: Steady Ongoing risk over time
#     * People have a steady ongoing risk over time, and thus health programs will have steady effects to reduce mortality.
#     * Even if someone makes bold changes to their lifestyle due to health initiatives, mortality effects will steadily increase/decrease.
#     * Reference: On the Use of Markov Models in Pharmacoeconomics: Pros and Cons and Implications for Policy Makers
# 6. Assumption: Time homogeneity of health programs
#     * The effectiveness of the health programs that we have chosen will remain steady over time.
#     * For example, the effectiveness of smoking cessation campaigns will neither improve or be impaired
#

