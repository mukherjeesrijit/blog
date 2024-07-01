from manim import *

config.media_width = "75%"
config.verbosity = "WARNING"

%%manim -qm LikelihoodProof

class LikelihoodProof(Scene):
    def construct(self):
        
        title = Title("Logistic Regression Loss Function", include_underline=False)

        # Add the title to the scene
        self.add(title)
        self.wait(4)
        
        # Display the likelihood function
        likelihood_eq = MathTex(
            "L(\\theta)", "=", "-\\log", "\\text{ Likelihood}(\\theta)", "=", 
            "-\\log \\prod_{i=1}^n P(Y_i = y_i | X = x_i)"
        )
        self.play(Write(likelihood_eq))
        self.wait(4)

        # Transform to product of probabilities
        prod_probs_eq = MathTex(
            "=", "-\\log \\prod_{i=1}^n p_i^{y_i} (1 - p_i)^{(1 - y_i)}"
        )
        prod_probs_eq.next_to(likelihood_eq, DOWN)
        self.play(Write(prod_probs_eq))
        self.wait(5)

        # Convert product to sum
        sum_eq = MathTex(
            "=", "-\\sum_{i=1}^n y_i \\log(p_i) + (1 - y_i) \\log(1 - p_i)"
        )
        sum_eq.next_to(prod_probs_eq, DOWN)
        self.play(Write(sum_eq))
        self.wait(5)
        self.clear()        
        
        sum_eq1 = MathTex(
            "-\\sum_{i=1}^n y_i \\log(p_i) + (1 - y_i) \\log(1 - p_i)"
        )

        self.play(Write(sum_eq1))
        self.wait(3)
        
        # Create a red box around the equation
        box = SurroundingRectangle(sum_eq1, color=RED)
        self.play(Create(box))  # Make sure to use Create for the latest versions of Manim
        self.wait(1)
        
        # Add the label "Binary Cross Entropy Loss" above the box
        label = Text("Binary Cross Entropy Loss", color=RED).next_to(box, UP)
        self.play(Write(label))
        self.wait(4)
