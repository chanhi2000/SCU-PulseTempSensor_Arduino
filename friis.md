(1)    Finding Range from Power.
Given
$$
\underset{\text{Friis Transmission Theorem}}{P_\text{Rx}=G_\text{Tx}G_\text{Rx}P_\text{Tx}\left(\frac{\lambda}{4\pi{r}}\right)^2}
$$
and 
$$
\begin{align*}
P_\text{Rx}&=-70\:\text{dBm}\\
&=10^{\tfrac{-70}{10}}\:\text{W}\\
&=100\:\text{nW}\\\\
P_\text{Tx}&=3\:\left[\text{V}\right]\times0.1\:\left[\text{A}\right]\\
&=0.3\:\text{W}\\\\
\underset{\text{monopole}}{G_\text{Rx}}&=5.19\\
&=10^{\tfrac{5.19}{10}}\:\text{W}\\
&=3.3037\:\text{W}\\\\
\underset{\text{monopole}}{G_\text{Tx}}&=\underset{\text{monopole}}{G_\text{Rx}}=3.3037\:\text{W}\\\\
\underset{\text{de Broglie}}{\lambda}&=\frac{c}{f}
=\frac{\left(3\times10^{8}\right)}{\left(2.4\times10^{9}\right)}\\&=0.125\:\text{m}\\
l&=\frac{\lambda}{4}=\frac{(0.125)}{4}\\
&=0.03125\:\text{m}=31.25\:\text{mm}\\
l_\text{measured}&\approx38\:\text{mm}
\end{align*}
$$
We can find the range by rearranging equation such that
$$
\begin{align*}
(r)^2&=\left(\frac{\lambda}{4\pi}\right)^2G_\text{Tx}G_\text{Rx}\frac{P_\text{Tx}}{P_\text{Rx}}\\
r&=\frac{\lambda}{4\pi}\sqrt{G_\text{Tx}G_\text{Rx}\frac{P_\text{Tx}}{P_\text{Rx}}}\\
&=\frac{0.125}{4\pi}\sqrt{(3.3037)(3.3037)\frac{\left(0.3\right)}{\left(10^{-7}\right)}}
&=56.9195\:\text{m}
\end{align*}
$$

(2)    Confirming power using measured range
Not knowing what the received Power,
$$
\begin{align*}
r_\text{measured}&=76\:\text{ft}\\
&=23.165\:\text{m}\\\\
P_\text{Tx}&=0.3\:\text{W}\\
G_\text{Tx}&=G_\text{Rx}=3.3037\\
\lambda&=0.125\:\text{m}
\end{align*}
$$
Find $$P_\text{Rx}$$ by plugging in values
$$\begin{align*}P_\text{Rx}&=G_\text{Tx}G_\text{Rx}P_\text{Tx}\left(\frac{\lambda}{4\pi{r}}\right)^2\\&=(3.3037)(3.3037)(0.3)\left(\frac{(0.125))}{4\pi(23.165)}\right)^2\\&=6.30375\times10^{-7}\:\text{W}\\&=10\log_{10}{\left(6.30375\times10^{-7}\right)}\:\text{dBm}\\&=-62.0\:\text{dBm}\end{align*}$$
