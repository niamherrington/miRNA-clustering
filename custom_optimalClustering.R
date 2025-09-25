custom_optimalClustering <- function(data, clusters, algorithm) {
  if (algorithm == "spectral") {
    spectral.kernels <- c("rbfdot", "polydot", "vanilladot", 
                          "tanhdot", "laplacedot", "anovadot", "splinedot")
    optimal.stability <- 0
    optimal.memberships <- seq(0, 0, length.out = dim(data)[1])
    for (par in spectral.kernels) {
      sc.boot <- fpc::clusterboot(data, B = 25, bootmethod = "boot", 
                                  clustermethod = speccCBI, k = clusters, kernel = par, 
                                  seed = 28588, showplots = FALSE, count = FALSE)
      if (mean(sc.boot$bootmean) > optimal.stability) {
        optimal.stability <- mean(sc.boot$bootmean)
        optimal.memberships <- sc.boot$partition
        optimal.parameter <- par
      }
    }
  }
  else if (algorithm == "hierarchical") {
    hierarchical.methods <- c("average", "ward.D", "ward.D2", 
                              "single", "complete", "mcquitty", "median", "centroid")
    optimal.stability <- 0
    optimal.memberships <- seq(0, 0, length.out = dim(data)[1])
    for (par in hierarchical.methods) {
      sc.boot <- fpc::clusterboot(data, B = 25, bootmethod = "boot", 
                                  clustermethod = hclustCBI, k = clusters, method = par, 
                                  seed = 28588, showplots = FALSE, count = FALSE)
      if (mean(sc.boot$bootmean) > optimal.stability) {
        optimal.stability <- mean(sc.boot$bootmean)
        optimal.memberships <- sc.boot$partition
        optimal.parameter <- par
      }
    }
  }
  else {
    kmeans.kernels <- c("Hartigan-Wong", "Lloyd", "Forgy", 
                        "MacQueen")
    optimal.stability <- 0
    optimal.memberships <- seq(0, 0, length.out = dim(data)[1])
    for (par in kmeans.kernels) {
      sc.boot <- fpc::clusterboot(data, B = 25, bootmethod = "boot", 
                                  clustermethod = kmeansCBI, k = clusters, algorithm = par, 
                                  seed = 28588, showplots = FALSE, count = FALSE)
      if (mean(sc.boot$bootmean) > optimal.stability) {
        optimal.stability <- mean(sc.boot$bootmean)
        optimal.memberships <- sc.boot$partition
        optimal.parameter <- par
      }
    }
  }
  memberships <- data.frame(memberships = optimal.memberships)
  return(memberships)
}