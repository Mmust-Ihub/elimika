from .prompts import PERSONALIZED

from decouple import config
import os
import google.generativeai as genai 

GEMINI_API_KEY = config("GEMINI_API_KEY", default="")
genai.configure(api_key=GEMINI_API_KEY)

# Create the model
generation_config = {
    "temperature": 1,
    "top_p": 0.95,
    "top_k": 40,
    "max_output_tokens": 8192,
    "response_mime_type": "text/plain",
}

model = genai.GenerativeModel(
    model_name="gemini-2.0-flash",
    generation_config=generation_config,
    system_instruction='Create a personalized lesson under the Kenyan Competency-Based Curriculum (CBC) for a student in grade 1 make the lesson easy to comprehend for child in that level based on the following details the lesson should have six sections:\n\nStudent\'s Interests: football, music, technology\nSubject & Learning Area:Mathematics\nCompetency Focus:  problem-solving, critical thinking, creativity\nPreferred Learning Style:  hands-on, \nResponse Format \nProvide the lesson plan in the following structured chunks and wait for my "next" command before proceeding to the next part.\n\nSection 1: Lesson Overview\nLesson Title: A captivating title that connects the subject to the student’s interest.\nLearning Outcome: Clearly defined CBC-aligned learning goals.\n(Wait for "next")\nSection 2: Introduction\nA brief and engaging introduction that links the topic to the student’s interest.\n(Wait for "next")\nSection 3: Interactive Learning Activity\nA hands-on, real-world application that aligns with both the subject and the student’s passion.\n(Wait for "next")\nSection 4: Practical Application\nWays to apply the lesson in the student\'s everyday environment.\n(Wait for "next")\nSection 5: Assessment & Reflection\nEngaging ways to assess understanding, such as a mini-project, storytelling session, or a creative task based on the student’s interest.\n(Wait for "next")\nChunk 6: Home-Based Extension\nSimple activities parents can use to reinforce learning at home, ensuring alignment with CBC objectives.\njust build the lesson plan without saying that you are building the plan. just begin',
)

chat_session = model.start_chat(
    history=[
       
    ]
)
def get_response(text):
    response = chat_session.send_message(text)
    return response.text

# print(response.text)
