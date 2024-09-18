Task: Make sure you draw the Probability Tree Diagram in Python the {New Problem} using the three Examples {Example 1}, {Example 2}, {Example 3}, {Example 4}, {Example 5}, {Example 6} below. Identify the correct *Given Event* and the *Required Event*. Always make all the paths to the *Given Event = BOLD*, and make all the paths containing the *Required Event = COLORED* as done in the examples below.

New Problem =
"At a certain stage of a criminal investigation, the inspector in charge is 60 percent convinced of the guilt of a certain suspect. Suppose, however, that a new piece of evidence which shows that the criminal has a certain characteristic (such as left-handedness, baldness, or brown hair) is uncovered. If 20 percent of the population possesses this characteristic, how certain of the guilt of the suspect should the inspector now be if it turns out that the suspect has the characteristic?"

Example 1 =
"from graphviz import Digraph

def create_horizontal_bayes_tree_with_highlight():

    """
    On a game show, a contestant can select one of four boxes. The red box contains one $100 bill and nine $1 bills. A green box contains two $100 bills and eight $1 bills. A blue box contains three $100 bills and seven $1 bills. A yellow box contains five $100 bills and five $1 bills. The contestant selects a box at random and selects a bill from the box at random. If a $100 bill is selected, find the probability that it came from the yellow box
    """

    # Create a directed graph with left-to-right layout
    dot = Digraph(comment='Bayes Theorem Tree')
    dot.attr(rankdir='LR')  # Set layout to left-to-right

    # Add box selection nodes (minimal variables: just the box and $100/$1 outcome)
    dot.node('S', 'Select Box')
    dot.node('R', 'Red Box', color='red')
    dot.node('G', 'Green Box')
    dot.node('B', 'Blue Box')
    dot.node('Y', 'Yellow Box')

    # Add bill selection nodes
    dot.node('H_R', '$100 (R)', color='red')
    dot.node('H_G', '$100 (G)')
    dot.node('H_B', '$100 (B)')
    dot.node('H_Y', '$100 (Y)')

    dot.node('L_R', '$1 (R)')
    dot.node('L_G', '$1 (G)')
    dot.node('L_B', '$1 (B)')
    dot.node('L_Y', '$1 (Y)')

    # Add edges for box selection
    dot.edge('S', 'R', label='1/4', style='bold', penwidth='5', color='red')
    dot.edge('S', 'G', label='1/4', style='bold', penwidth='5')
    dot.edge('S', 'B', label='1/4', style='bold', penwidth='5')
    dot.edge('S', 'Y', label='1/4', style='bold', penwidth='5')

    # Add edges for bill selection
    # Highlight the paths leading to $100 bills (bold, larger)
    dot.edge('R', 'H_R', label='1/10', style='bold', penwidth='5', color='red')
    dot.edge('G', 'H_G', label='2/10', style='bold', penwidth='5')
    dot.edge('B', 'H_B', label='3/10', style='bold', penwidth='5')
    dot.edge('Y', 'H_Y', label='5/10', style='bold', penwidth='5')

    # Normal paths for $1 bills
    dot.edge('R', 'L_R', label='9/10')
    dot.edge('G', 'L_G', label='8/10')
    dot.edge('B', 'L_B', label='7/10')
    dot.edge('Y', 'L_Y', label='5/10')

    return dot

# Render and display the tree
highlighted_bayes_tree = create_horizontal_bayes_tree_with_highlight()
highlighted_bayes_tree.render('problem1', format='png', view=True)"

Example 2 =
"
from graphviz import Digraph

def create_blackbox_bayes_tree_with_highlight():

    """
    A plane's "black-box" is manufactured by only 3 companies: AirCorp, BigSkies, and CharterUS - who make 80%, 15%, and 5% of all the black-boxes made, respectively. Invariably, some of these are defective. Assuming the percentage of defective black-boxes made by AirCorp, BigSkies, and CharterUS are 4%, 6%, and 9%, respectively, find the probability that a randomly selected black-box from all black-boxes made that is found to be defective came from AirCorp.
    """

    # Create a directed graph with left-to-right layout
    dot = Digraph(comment='Bayes Theorem Tree')
    dot.attr(rankdir='LR')  # Set layout to left-to-right

    # Add company selection nodes
    dot.node('S', 'Select Company')
    dot.node('A', 'AirCorp', color='blue')
    dot.node('B', 'BigSkies')
    dot.node('C', 'CharterUS')

    # Add defect selection nodes
    dot.node('D_A', 'Defective (A)', color='blue')
    dot.node('D_B', 'Defective (B)')
    dot.node('D_C', 'Defective (C)')

    dot.node('N_A', 'Not Defective (A)')
    dot.node('N_B', 'Not Defective (B)')
    dot.node('N_C', 'Not Defective (C)')

    # Add edges for company selection (bolded)
    dot.edge('S', 'A', label='80%', style='bold', penwidth='5', color='blue')  # AirCorp path
    dot.edge('S', 'B', label='15%', style='bold', penwidth='5')
    dot.edge('S', 'C', label='5%', style='bold', penwidth='5')

    # Add edges for defect selection (bold and colored for AirCorp)
    dot.edge('A', 'D_A', label='4%', style='bold', penwidth='5', color='blue')  # AirCorp defective path
    dot.edge('B', 'D_B', label='6%', style='bold', penwidth='5')
    dot.edge('C', 'D_C', label='9%', style='bold', penwidth='5')

    # Normal paths for not defective black-boxes
    dot.edge('A', 'N_A', label='96%')
    dot.edge('B', 'N_B', label='94%')
    dot.edge('C', 'N_C', label='91%')

    return dot

# Render and display the tree
blackbox_bayes_tree = create_blackbox_bayes_tree_with_highlight()
blackbox_bayes_tree.render('problem2', format='png', view=True)
"
Example 3 =
"
from graphviz import Digraph

def create_blanket_bayes_tree_with_highlight():

    """
    Two manufacturers supply blankets to emergency relief organizations. Manufacturer A supplies 3000 blankets and 4% are irregular in workmanship. Manufacturer B supplies 2400 blankets and 7% are found to be irregular. Given that a blanket is irregular, find the probability that it came from manufacturer B.
    """

    # Create a directed graph with left-to-right layout
    dot = Digraph(comment='Bayes Theorem Tree')
    dot.attr(rankdir='LR')  # Set layout to left-to-right

    # Add manufacturer selection nodes
    dot.node('S', 'Select Manufacturer')
    dot.node('A', 'Manufacturer A')
    dot.node('B', 'Manufacturer B', color='blue')

    # Add irregularity selection nodes
    dot.node('I_A', 'Irregular (A)')
    dot.node('I_B', 'Irregular (B)', color='blue')

    dot.node('N_A', 'Regular (A)')
    dot.node('N_B', 'Regular (B)')

    # Add edges for manufacturer selection
    dot.edge('S', 'A', label='3000 blankets\n(60%)', style='bold', penwidth='5')
    dot.edge('S', 'B', label='2400 blankets\n(40%)', style='bold', penwidth='5', color='blue')

    # Add edges for irregularity selection
    dot.edge('A', 'I_A', label='4%', style='bold', penwidth='5')
    dot.edge('B', 'I_B', label='7%', style='bold', penwidth='5', color='blue')

    # Normal paths for regular blankets
    dot.edge('A', 'N_A', label='96%')
    dot.edge('B', 'N_B', label='93%', color='blue')

    return dot

# Render and display the tree
blanket_bayes_tree = create_blanket_bayes_tree_with_highlight()
blanket_bayes_tree.render('blanket_problem', format='png', view=True)
"

Example 4 = "from graphviz import Digraph

def create_cookie_bayes_tree_with_highlight():
    """
    Suppose there are two full bowls of cookies. Bowl #1 has 10 chocolate chip and 30 plain cookies, 
    while Bowl #2 has 20 of each. Our friend Fred picks a bowl at random, and then picks a cookie at random.
    The cookie turns out to be a plain one. How probable is it that Fred picked it out of Bowl #1?
    """

    # Create a directed graph with left-to-right layout
    dot = Digraph(comment='Bayes Theorem Tree')
    dot.attr(rankdir='LR')  # Set layout to left-to-right

    # Add bowl selection nodes
    dot.node('S', 'Select Bowl')
    dot.node('B1', 'Bowl #1', color='blue')
    dot.node('B2', 'Bowl #2')

    # Add cookie selection nodes
    dot.node('P_B1', 'Plain (B1)', color='blue')
    dot.node('P_B2', 'Plain (B2)', color='blue')

    dot.node('C_B1', 'Chocolate Chip (B1)')
    dot.node('C_B2', 'Chocolate Chip (B2)')

    # Add edges for bowl selection (bolded)
    dot.edge('S', 'B1', label='1/2', style='bold', penwidth='5', color='blue')  # Bowl #1 path
    dot.edge('S', 'B2', label='1/2', style='bold', penwidth='5')

    # Add edges for cookie selection
    dot.edge('B1', 'P_B1', label='30/40', style='bold', penwidth='5', color='blue')  # Plain from Bowl #1
    dot.edge('B2', 'P_B2', label='20/40', style='bold', penwidth='5', color='blue')  # Plain from Bowl #2

    # Normal paths for chocolate chip cookies
    dot.edge('B1', 'C_B1', label='10/40')
    dot.edge('B2', 'C_B2', label='20/40')

    return dot

# Render and display the tree
cookie_bayes_tree = create_cookie_bayes_tree_with_highlight()
cookie_bayes_tree.render('cookie_problem', format='png', view=True)
"

Example 5 ="from graphviz import Digraph

def create_mms_probability_tree_with_highlight():
    """
    Given two bags of M&Ms, one from 1994 and one from 1996, find the probability that a yellow M&M came from the 1994 bag.
    """

    # Create a directed graph with left-to-right layout
    dot = Digraph(comment='M&M Probability Tree')
    dot.attr(rankdir='LR')  # Set layout to left-to-right

    # Add bag selection nodes
    dot.node('S', 'Select Bag')
    dot.node('B1994', 'Bag 1994', color='blue')
    dot.node('B1996', 'Bag 1996')

    # Add M&M color nodes
    dot.node('Y1994', 'Yellow (1994)', color='blue')
    dot.node('G1994', 'Green (1994)')
    dot.node('Y1996', 'Yellow (1996)', color='blue')
    dot.node('G1996', 'Green (1996)')

    # Add edges for bag selection (bolded)
    dot.edge('S', 'B1994', label='1/2', style='bold', penwidth='5', color='blue')  # Bag 1994 path
    dot.edge('S', 'B1996', label='1/2', style='bold', penwidth='5')

    # Add edges for color selection (bold and colored for yellow M&Ms)
    dot.edge('B1994', 'Y1994', label='20%', style='bold', penwidth='5', color='blue')  # Yellow from Bag 1994
    dot.edge('B1994', 'G1994', label='10%')
    dot.edge('B1996', 'Y1996', label='14%', style='bold', penwidth='5', color='blue')  # Yellow from Bag 1996
    dot.edge('B1996', 'G1996', label='20%')

    return dot

# Render and display the tree
mms_probability_tree = create_mms_probability_tree_with_highlight()
mms_probability_tree.render('mms_problem', format='png', view=True)
"

Example 6 = "from graphviz import Digraph

def create_smoking_bayes_tree_with_highlight():
    """
    50% of people don't smoke, 20% are light smokers & 30% are heavy smokers.
    Heavy smokers are twice as likely to die prematurely as light smokers,
    light smokers are twice as likely to die prematurely as nonsmokers.
    What's the probability of being a heavy smoker given person died prematurely?
    """

    # Create a directed graph with left-to-right layout
    dot = Digraph(comment='Smoking and Premature Death Probability Tree')
    dot.attr(rankdir='LR')  # Set layout to left-to-right

    # Add smoking status selection nodes
    dot.node('S', 'Select Smoking Status')
    dot.node('N', 'No Smoking', color='blue')
    dot.node('L', 'Light Smoking')
    dot.node('H', 'Heavy Smoking')

    # Add death nodes
    dot.node('D_N', 'Premature Death (N)', color='blue')
    dot.node('D_L', 'Premature Death (L)')
    dot.node('D_H', 'Premature Death (H)')
    
    dot.node('S_N', 'Survival (N)')
    dot.node('S_L', 'Survival (L)')
    dot.node('S_H', 'Survival (H)')

    # Add edges for smoking status (bolded)
    dot.edge('S', 'N', label='50%', style='bold', penwidth='5', color='blue')  # No Smoking path
    dot.edge('S', 'L', label='20%', style='bold', penwidth='5')
    dot.edge('S', 'H', label='30%', style='bold', penwidth='5')

    # Add edges for death probability
    dot.edge('N', 'D_N', label='p', style='bold', penwidth='5', color='blue')  # No Smoking death path
    dot.edge('L', 'D_L', label='2p', style='bold', penwidth='5')
    dot.edge('H', 'D_H', label='4p', style='bold', penwidth='5')

    # Normal paths for survival
    dot.edge('N', 'S_N', label='1-p')
    dot.edge('L', 'S_L', label='1-2p')
    dot.edge('H', 'S_H', label='1-4p')

    return dot

# Render and display the tree
smoking_bayes_tree = create_smoking_bayes_tree_with_highlight()
smoking_bayes_tree.render('smoking_problem', format='png', view=True)
"


