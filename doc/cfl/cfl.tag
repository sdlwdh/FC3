<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile>
  <compound kind="file">
    <name>Approx.hpp</name>
    <path>/home/dima/git/FC-III/CPP/cfl/</path>
    <filename>Approx_8hpp</filename>
    <includes id="Function_8hpp" name="Function.hpp" local="yes" imported="no">cfl/Function.hpp</includes>
    <includes id="Macros_8hpp" name="Macros.hpp" local="yes" imported="no">cfl/Macros.hpp</includes>
    <class kind="class">cfl::IApprox</class>
    <class kind="class">cfl::Approx</class>
    <namespace>cfl</namespace>
  </compound>
  <compound kind="file">
    <name>Error.hpp</name>
    <path>/home/dima/git/FC-III/CPP/cfl/</path>
    <filename>Error_8hpp</filename>
    <includes id="Macros_8hpp" name="Macros.hpp" local="yes" imported="no">cfl/Macros.hpp</includes>
    <class kind="class">cfl::Error</class>
    <namespace>cfl</namespace>
    <namespace>cfl::NError</namespace>
    <member kind="function">
      <type>Error</type>
      <name>range</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>a894a502c1601ee82feaadffd50b93002</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
    <member kind="function">
      <type>Error</type>
      <name>sort</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>a1eded1c862e839e80fb15a8ffbffcd67</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
    <member kind="function">
      <type>Error</type>
      <name>size</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>ac6ec8baaccb77da7ec8d57c2290a3a14</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Fit.hpp</name>
    <path>/home/dima/git/FC-III/CPP/cfl/</path>
    <filename>Fit_8hpp</filename>
    <includes id="Function_8hpp" name="Function.hpp" local="yes" imported="no">cfl/Function.hpp</includes>
    <class kind="class">cfl::IFit</class>
    <class kind="class">cfl::Fit</class>
    <namespace>cfl</namespace>
  </compound>
  <compound kind="file">
    <name>Function.hpp</name>
    <path>/home/dima/git/FC-III/CPP/cfl/</path>
    <filename>Function_8hpp</filename>
    <class kind="class">cfl::IFunction</class>
    <class kind="class">cfl::Function</class>
    <namespace>cfl</namespace>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga9002e8a5719a0e0f8641c07c2776c65f</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga23508570c1c867b26314fef7b138ec8f</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga791881014381dc9299817a8ee54c01a4</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga780c9857fc017d7e7e0a189f37780853</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga5a9609f238dcd27d489c120d300e8d2f</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaa56f481d9efec745cc2441743735f56e</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga4b95eadaa3cd0c7555aa12ef099cb083</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gadd70bb3e3d448678e90960b415fb253c</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaa2901a847a20fd95fce20b72d94608ca</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaafb41bdcea13efa36de86fab86a8c8d7</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaebb9ffd9ebdf865392443b29a8ca3e81</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga7724362a5921d2ca77728d86c99a76f7</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga89ab2b0065cd02be196a8eb8e2100bab</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>max</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga818467a1c24bb466249fc94e715a20a8</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>max</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gac8b6339f61b0b4743d4c37cbedabd52a</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>max</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gae59b2dbc35a30733038003fa229dfd41</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>min</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga2a2011208922a91cb8db32047e651652</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>min</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga0e6296bbb61229a54b13973d39f8bc18</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>min</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga31fb5d4c5e1e05b6ba283fff8bb99e51</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>pow</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga0ad815989b496eb88418f0cfacb86a8b</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>abs</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga57c16d6a064f32801f2e623e316d2c08</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>exp</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga52c70d0f89df857c746bc8cd465b4492</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>log</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga7a3f02432f55b86da5cda89b0ba989ff</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>sqrt</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gad5d6807fd56f4f4d275aef884a1a4db6</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>GaussRollback.hpp</name>
    <path>/home/dima/git/FC-III/CPP/cfl/</path>
    <filename>GaussRollback_8hpp</filename>
    <includes id="Macros_8hpp" name="Macros.hpp" local="yes" imported="no">Macros.hpp</includes>
    <class kind="class">cfl::IGaussRollback</class>
    <class kind="class">cfl::GaussRollback</class>
    <namespace>cfl</namespace>
  </compound>
  <compound kind="file">
    <name>Ind.hpp</name>
    <path>/home/dima/git/FC-III/CPP/cfl/</path>
    <filename>Ind_8hpp</filename>
    <class kind="class">cfl::IInd</class>
    <class kind="class">cfl::Ind</class>
    <namespace>cfl</namespace>
  </compound>
  <compound kind="file">
    <name>Index.hpp</name>
    <path>/home/dima/git/FC-III/CPP/cfl/</path>
    <filename>Index_8hpp</filename>
  </compound>
  <compound kind="file">
    <name>Interp.hpp</name>
    <path>/home/dima/git/FC-III/CPP/cfl/</path>
    <filename>Interp_8hpp</filename>
    <includes id="Function_8hpp" name="Function.hpp" local="yes" imported="no">cfl/Function.hpp</includes>
    <class kind="class">cfl::IInterp</class>
    <class kind="class">cfl::Interp</class>
    <namespace>cfl</namespace>
  </compound>
  <compound kind="file">
    <name>Macros.hpp</name>
    <path>/home/dima/git/FC-III/CPP/cfl/</path>
    <filename>Macros_8hpp</filename>
    <namespace>cfl</namespace>
    <member kind="define">
      <type>#define</type>
      <name>PRECONDITION</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gad98dcd871dcffebd5a39802226a429b1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>ASSERT</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gaf343b20373ba49a92fce523e948f2ab3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>POSTCONDITION</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>ga41c215e9b1a35b82ddacbdbd2dfd707d</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Approx</name>
    <filename>classcfl_1_1Approx.html</filename>
    <member kind="function">
      <type></type>
      <name>Approx</name>
      <anchorfile>classcfl_1_1Approx.html</anchorfile>
      <anchor>ada574d5e0526b55ac8ec426f82f6eae5</anchor>
      <arglist>(IApprox *pNewP=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classcfl_1_1Approx.html</anchorfile>
      <anchor>a4229f3a21dc69b596b173f9d0ce496b9</anchor>
      <arglist>(double dLeft, double dRight)</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; double &gt; &amp;</type>
      <name>arg</name>
      <anchorfile>classcfl_1_1Approx.html</anchorfile>
      <anchor>a9308d41f527bee16a5e6f5dee44c5e65</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>cfl::Function</type>
      <name>approximate</name>
      <anchorfile>classcfl_1_1Approx.html</anchorfile>
      <anchor>a065edfea781fc7549ba5cf4226bf5165</anchor>
      <arglist>(InIt itValBegin, InIt itValEnd) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Error</name>
    <filename>classcfl_1_1Error.html</filename>
    <base>std::exception</base>
    <member kind="function">
      <type></type>
      <name>Error</name>
      <anchorfile>classcfl_1_1Error.html</anchorfile>
      <anchor>ac4e18e7c69d7496311499efcee71109d</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~Error</name>
      <anchorfile>classcfl_1_1Error.html</anchorfile>
      <anchor>a17651eacec78054fa26ba3f52d1387f0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const char *</type>
      <name>what</name>
      <anchorfile>classcfl_1_1Error.html</anchorfile>
      <anchor>a11b9cd25fb692618c78186f6c84bacfb</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Fit</name>
    <filename>classcfl_1_1Fit.html</filename>
    <member kind="function">
      <type></type>
      <name>Fit</name>
      <anchorfile>classcfl_1_1Fit.html</anchorfile>
      <anchor>ac6bf5ff8f24b17664d31529cef6c2b03</anchor>
      <arglist>(IFit *pNewP=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classcfl_1_1Fit.html</anchorfile>
      <anchor>af0db58671e5abc17ddeebf6ea1ce21a1</anchor>
      <arglist>(InIt1 itArgBegin, InIt1 itArgEnd, InIt2 itValBegin)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classcfl_1_1Fit.html</anchorfile>
      <anchor>a636555d35d6e4ce025ee36b2e3f28704</anchor>
      <arglist>(InIt1 itArgBegin, InIt1 itArgEnd, InIt2 itValBegin, InIt3 itWtBegin)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>fit</name>
      <anchorfile>classcfl_1_1Fit.html</anchorfile>
      <anchor>a3f5e9bfc7b8e4bfc934b029bec23397a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>err</name>
      <anchorfile>classcfl_1_1Fit.html</anchorfile>
      <anchor>a9fdfb6dd1cdf9f7ddfbec2e726978d95</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Function</name>
    <filename>classcfl_1_1Function.html</filename>
    <member kind="function">
      <type></type>
      <name>Function</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a8e9955737cabf9a3d23ea1a0ba988fff</anchor>
      <arglist>(double dV=0., double dLeft=-std::numeric_limits&lt; double &gt;::max(), double dRight=std::numeric_limits&lt; double &gt;::max())</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Function</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>aaf7e32ded0390fbe8ccdeed8612a5330</anchor>
      <arglist>(IFunction *pNewP)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Function</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a4f39329804b76024dd7a217f3e913e66</anchor>
      <arglist>(const std::function&lt; double(double)&gt; &amp;rF, double dLeft=-std::numeric_limits&lt; double &gt;::max(), double dRight=std::numeric_limits&lt; double &gt;::max())</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Function</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a67f948aaac73c26826f65a987f479a9c</anchor>
      <arglist>(const std::function&lt; double(double)&gt; &amp;rF, const std::function&lt; bool(double)&gt; &amp;rBelongs)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>adf95def0d7df287a9ef01acd65552c17</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a8cc45c57aa5bcf30ec0bf6acce3c7670</anchor>
      <arglist>(double dX) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>belongs</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a85bc8e51a6eb4e33405e6a187b745183</anchor>
      <arglist>(double dX) const</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator+=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>aef4b99503792742de62192daa79c6df2</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator*=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a0cf890ed3d1f86169c569e46d9a5a577</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator-=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a24e5f65408691f1bbba52a3858fb57e1</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator/=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a4c28095c96d5d4e0be0c2f65825d67a7</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator+=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a47131c6d5d37011c27ac4a88bb123a72</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator-=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a31be17e6c19669483ba035dc98eb61cf</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator*=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a943ec89197f3b36d516b9bbfa5ca2ba0</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator/=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>ae7432ab8c298edd20dd6e91115b259f4</anchor>
      <arglist>(double dV)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::GaussRollback</name>
    <filename>classcfl_1_1GaussRollback.html</filename>
    <member kind="function">
      <type></type>
      <name>GaussRollback</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>a56156e7d689cdea57fee740b47188e8e</anchor>
      <arglist>(IGaussRollback *pNewP=0, unsigned iSize=0, double dH=0, double dVar=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>a7fb906726094b5b9b61a4de4a5320c41</anchor>
      <arglist>(unsigned iSize, double dH, double dVar)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rollback</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>ab6c7d0f33435160c80ea3c57650428d1</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rollback</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>a9294fcc52e425d805248d8a00f99c9c7</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues, std::valarray&lt; double &gt; &amp;rDelta) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rollback</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>a25d07eb8274cea2c6311cfcd495a9771</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues, std::valarray&lt; double &gt; &amp;rDelta, std::valarray&lt; double &gt; &amp;rGamma) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>vega</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>ad74fbe4c9454a49589e7959fb9f3704b</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rGammaToVega) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IApprox</name>
    <filename>classcfl_1_1IApprox.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IApprox</name>
      <anchorfile>classcfl_1_1IApprox.html</anchorfile>
      <anchor>a273b39cddc4d2817b98fc5650c99f006</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IApprox *</type>
      <name>newApprox</name>
      <anchorfile>classcfl_1_1IApprox.html</anchorfile>
      <anchor>a6ff3e8f0ebfe9a188ae0349304f821af</anchor>
      <arglist>(double dLeft, double dRight) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual const std::vector&lt; double &gt; &amp;</type>
      <name>arg</name>
      <anchorfile>classcfl_1_1IApprox.html</anchorfile>
      <anchor>abf1a2223055196d4a6e5c30004173c85</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Function</type>
      <name>approximate</name>
      <anchorfile>classcfl_1_1IApprox.html</anchorfile>
      <anchor>acc427512691517425efade00cd972446</anchor>
      <arglist>(const std::vector&lt; double &gt; &amp;rValues) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IFit</name>
    <filename>classcfl_1_1IFit.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IFit</name>
      <anchorfile>classcfl_1_1IFit.html</anchorfile>
      <anchor>a0f1ad3a4b542cb3c18895efb88f37c7d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IFit *</type>
      <name>newObject</name>
      <anchorfile>classcfl_1_1IFit.html</anchorfile>
      <anchor>ab001e2b3b38dd8f1500ada71b10ef94f</anchor>
      <arglist>(const std::vector&lt; double &gt; &amp;rArg, const std::vector&lt; double &gt; &amp;rVal) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IFit *</type>
      <name>newObject</name>
      <anchorfile>classcfl_1_1IFit.html</anchorfile>
      <anchor>a06a886db39dac7a18a221abd51b76f94</anchor>
      <arglist>(const std::vector&lt; double &gt; &amp;rArg, const std::vector&lt; double &gt; &amp;rVal, const std::vector&lt; double &gt; &amp;rW) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Function</type>
      <name>fit</name>
      <anchorfile>classcfl_1_1IFit.html</anchorfile>
      <anchor>a9aa6875c865b7e7a0c72a6035a6a512c</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Function</type>
      <name>err</name>
      <anchorfile>classcfl_1_1IFit.html</anchorfile>
      <anchor>ad0f069690916e9503b5194293053a63b</anchor>
      <arglist>() const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IFunction</name>
    <filename>classcfl_1_1IFunction.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IFunction</name>
      <anchorfile>classcfl_1_1IFunction.html</anchorfile>
      <anchor>a9c437e68e806a7f590985935ea1539ce</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual double</type>
      <name>operator()</name>
      <anchorfile>classcfl_1_1IFunction.html</anchorfile>
      <anchor>a2b92b7827fcd085c30481d66d2b823e8</anchor>
      <arglist>(double dX) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>belongs</name>
      <anchorfile>classcfl_1_1IFunction.html</anchorfile>
      <anchor>a1a91da27455f02e77aa91895261dbc53</anchor>
      <arglist>(double dX) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IGaussRollback</name>
    <filename>classcfl_1_1IGaussRollback.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IGaussRollback</name>
      <anchorfile>classcfl_1_1IGaussRollback.html</anchorfile>
      <anchor>a9eb352964065abf762690b7cdc9a6c79</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IGaussRollback *</type>
      <name>newObject</name>
      <anchorfile>classcfl_1_1IGaussRollback.html</anchorfile>
      <anchor>a597d4145be0476ecae69fba2a4f59b81</anchor>
      <arglist>(unsigned iSize, double dH, double dVar) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>rollback</name>
      <anchorfile>classcfl_1_1IGaussRollback.html</anchorfile>
      <anchor>a5007e6a9cbaeb8334130e9aa774235ff</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IInd</name>
    <filename>classcfl_1_1IInd.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IInd</name>
      <anchorfile>classcfl_1_1IInd.html</anchorfile>
      <anchor>a78d07105ec121b0a363d4181712b0137</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>indicator</name>
      <anchorfile>classcfl_1_1IInd.html</anchorfile>
      <anchor>aa3a1ee62aeb1df6d899bf1f773b8e315</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues, double dBarrier) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IInterp</name>
    <filename>classcfl_1_1IInterp.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IInterp</name>
      <anchorfile>classcfl_1_1IInterp.html</anchorfile>
      <anchor>a9d10ce5642dda4db0397c2b0dfe8a7f7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Function</type>
      <name>interpolate</name>
      <anchorfile>classcfl_1_1IInterp.html</anchorfile>
      <anchor>a0ff5a765df9e6bd7145ced97c5894580</anchor>
      <arglist>(const std::vector&lt; double &gt; &amp;rArg, const std::vector&lt; double &gt; &amp;rVal) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Ind</name>
    <filename>classcfl_1_1Ind.html</filename>
    <member kind="function">
      <type></type>
      <name>Ind</name>
      <anchorfile>classcfl_1_1Ind.html</anchorfile>
      <anchor>a748d48468ebd0f020429ff05349ce9df</anchor>
      <arglist>(IInd *pNewInd=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>indicator</name>
      <anchorfile>classcfl_1_1Ind.html</anchorfile>
      <anchor>a17cfee96f914343364c41133639fb93e</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues, double dBarrier) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Interp</name>
    <filename>classcfl_1_1Interp.html</filename>
    <member kind="function">
      <type></type>
      <name>Interp</name>
      <anchorfile>classcfl_1_1Interp.html</anchorfile>
      <anchor>a0f4bd3f32e580f9f7fbbe829330d839a</anchor>
      <arglist>(IInterp *pNewP=0)</arglist>
    </member>
    <member kind="function">
      <type>cfl::Function</type>
      <name>interpolate</name>
      <anchorfile>classcfl_1_1Interp.html</anchorfile>
      <anchor>ab60ce076d118f0d34f7afa5934ed3e48</anchor>
      <arglist>(InIt1 itArgBegin, InIt1 itArgEnd, InIt2 itValBegin) const</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>cfl</name>
    <filename>namespacecfl.html</filename>
    <namespace>cfl::NError</namespace>
    <class kind="class">cfl::Approx</class>
    <class kind="class">cfl::Error</class>
    <class kind="class">cfl::Fit</class>
    <class kind="class">cfl::Function</class>
    <class kind="class">cfl::GaussRollback</class>
    <class kind="class">cfl::IApprox</class>
    <class kind="class">cfl::IFit</class>
    <class kind="class">cfl::IFunction</class>
    <class kind="class">cfl::IGaussRollback</class>
    <class kind="class">cfl::IInd</class>
    <class kind="class">cfl::IInterp</class>
    <class kind="class">cfl::Ind</class>
    <class kind="class">cfl::Interp</class>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga9002e8a5719a0e0f8641c07c2776c65f</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga23508570c1c867b26314fef7b138ec8f</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga791881014381dc9299817a8ee54c01a4</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga780c9857fc017d7e7e0a189f37780853</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga5a9609f238dcd27d489c120d300e8d2f</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaa56f481d9efec745cc2441743735f56e</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga4b95eadaa3cd0c7555aa12ef099cb083</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gadd70bb3e3d448678e90960b415fb253c</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaa2901a847a20fd95fce20b72d94608ca</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaafb41bdcea13efa36de86fab86a8c8d7</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaebb9ffd9ebdf865392443b29a8ca3e81</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga7724362a5921d2ca77728d86c99a76f7</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga89ab2b0065cd02be196a8eb8e2100bab</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>max</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga818467a1c24bb466249fc94e715a20a8</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>max</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gac8b6339f61b0b4743d4c37cbedabd52a</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>max</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gae59b2dbc35a30733038003fa229dfd41</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>min</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga2a2011208922a91cb8db32047e651652</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>min</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga0e6296bbb61229a54b13973d39f8bc18</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>min</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga31fb5d4c5e1e05b6ba283fff8bb99e51</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>pow</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga0ad815989b496eb88418f0cfacb86a8b</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>abs</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga57c16d6a064f32801f2e623e316d2c08</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>exp</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga52c70d0f89df857c746bc8cd465b4492</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>log</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga7a3f02432f55b86da5cda89b0ba989ff</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>sqrt</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gad5d6807fd56f4f4d275aef884a1a4db6</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>cfl::NError</name>
    <filename>namespacecfl_1_1NError.html</filename>
    <member kind="function">
      <type>Error</type>
      <name>range</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>a894a502c1601ee82feaadffd50b93002</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
    <member kind="function">
      <type>Error</type>
      <name>sort</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>a1eded1c862e839e80fb15a8ffbffcd67</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
    <member kind="function">
      <type>Error</type>
      <name>size</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>ac6ec8baaccb77da7ec8d57c2290a3a14</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>cflNumeric</name>
    <title>Numerical methods.</title>
    <filename>group__cflNumeric.html</filename>
    <subgroup>cflApprox</subgroup>
    <subgroup>cflFit</subgroup>
    <subgroup>cflGaussRollback</subgroup>
    <subgroup>cflInd</subgroup>
    <subgroup>cflInterp</subgroup>
  </compound>
  <compound kind="group">
    <name>cflApprox</name>
    <title>Approximation of one-dimensional functions.</title>
    <filename>group__cflApprox.html</filename>
    <class kind="class">cfl::IApprox</class>
    <class kind="class">cfl::Approx</class>
  </compound>
  <compound kind="group">
    <name>cflMisc</name>
    <title>Auxiliary items.</title>
    <filename>group__cflMisc.html</filename>
    <subgroup>cflError</subgroup>
    <subgroup>cflMacros</subgroup>
  </compound>
  <compound kind="group">
    <name>cflError</name>
    <title>Exceptions.</title>
    <filename>group__cflError.html</filename>
    <namespace>cfl::NError</namespace>
    <class kind="class">cfl::Error</class>
  </compound>
  <compound kind="group">
    <name>cflFit</name>
    <title>Fitting of one-dimensional functions.</title>
    <filename>group__cflFit.html</filename>
    <class kind="class">cfl::IFit</class>
    <class kind="class">cfl::Fit</class>
  </compound>
  <compound kind="group">
    <name>cflFunction</name>
    <title>One-dimensional function object.</title>
    <filename>group__cflFunction.html</filename>
    <class kind="class">cfl::IFunction</class>
    <class kind="class">cfl::Function</class>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga9002e8a5719a0e0f8641c07c2776c65f</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga23508570c1c867b26314fef7b138ec8f</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga791881014381dc9299817a8ee54c01a4</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga780c9857fc017d7e7e0a189f37780853</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga5a9609f238dcd27d489c120d300e8d2f</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaa56f481d9efec745cc2441743735f56e</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga4b95eadaa3cd0c7555aa12ef099cb083</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gadd70bb3e3d448678e90960b415fb253c</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaa2901a847a20fd95fce20b72d94608ca</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaafb41bdcea13efa36de86fab86a8c8d7</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaebb9ffd9ebdf865392443b29a8ca3e81</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga7724362a5921d2ca77728d86c99a76f7</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga89ab2b0065cd02be196a8eb8e2100bab</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>max</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga818467a1c24bb466249fc94e715a20a8</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>max</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gac8b6339f61b0b4743d4c37cbedabd52a</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>max</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gae59b2dbc35a30733038003fa229dfd41</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>min</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga2a2011208922a91cb8db32047e651652</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>min</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga0e6296bbb61229a54b13973d39f8bc18</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>min</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga31fb5d4c5e1e05b6ba283fff8bb99e51</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>pow</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga0ad815989b496eb88418f0cfacb86a8b</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>abs</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga57c16d6a064f32801f2e623e316d2c08</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>exp</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga52c70d0f89df857c746bc8cd465b4492</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>log</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga7a3f02432f55b86da5cda89b0ba989ff</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>sqrt</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gad5d6807fd56f4f4d275aef884a1a4db6</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>cflGaussRollback</name>
    <title>Conditional expectation with respect to one-dimensional gaussian distribution.</title>
    <filename>group__cflGaussRollback.html</filename>
    <class kind="class">cfl::IGaussRollback</class>
    <class kind="class">cfl::GaussRollback</class>
  </compound>
  <compound kind="group">
    <name>cflInd</name>
    <title>Indicators of one-dimensional functions.</title>
    <filename>group__cflInd.html</filename>
    <class kind="class">cfl::IInd</class>
    <class kind="class">cfl::Ind</class>
  </compound>
  <compound kind="group">
    <name>cflInterp</name>
    <title>Interpolation of one-dimensional functions.</title>
    <filename>group__cflInterp.html</filename>
    <class kind="class">cfl::IInterp</class>
    <class kind="class">cfl::Interp</class>
  </compound>
  <compound kind="group">
    <name>cflMacros</name>
    <title>Macros and constants.</title>
    <filename>group__cflMacros.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>PRECONDITION</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gad98dcd871dcffebd5a39802226a429b1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>ASSERT</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gaf343b20373ba49a92fce523e948f2ab3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>POSTCONDITION</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>ga41c215e9b1a35b82ddacbdbd2dfd707d</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>Library for the course &quot;Numerical Methods with C++&quot;</title>
    <filename>index</filename>
  </compound>
</tagfile>
