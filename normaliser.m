% Will be used to normalise the residual energy and potential forwarding nodes (PFNs) of a node
function normalised = normaliser(numerator,denominator)
    normalised = 1 - (numerator/denominator);
end