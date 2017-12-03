function [dz, xhat] = ppd_hgo1a(t, z, y, rho, k)
    n = size(z, 1);
    K = k.^(1:n);
    K = K(:);
    
    e1 = y - z(1);
    xi = e1./rho(t);
    eps1 = log((1 + xi)./(1 - xi));
    
    [A, ~] = brunovsky(n);

    dz = A*z + K.*eps1;
    xhat = z(:);
    if any(imag(z) ~= 0)
        warning(['Escaped performance bounds at t = ' num2str(t)]);
        close(gcf)
    end
end
