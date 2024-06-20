function ff = fitness_func()
    normed_res_energy = normaliser(numerator,denominator);
    pfns = normaliser(numerator,denominator);
    ff = w_depth/(1+normed_res_energy*pfns);
end