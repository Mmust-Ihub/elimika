from decouple import config
from .prompts import PATH_ANALYSIS
import google.generativeai as genai
from school.models import Student, Result, Subject


GEMINI_API_KEY = config("GEMINI_API_KEY", default="")
genai.configure(api_key=GEMINI_API_KEY)

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
    system_instruction="""Analyze the following student data:
Academic performance ([insert CBC subjects & competency levels])
Practical skills ([insert extracurricular activities, project work, and hobbies])
Behavioral and personality traits ([insert available data, e.g., leadership, teamwork, creativity, problem-solving])
Interests ([insert self-reported interests or identified strengths])
Based on this information and the structure of the Kenyan education system, suggest three potential career pathways that align with the student’s strengths and interests. For each career path, include:
A brief explanation of why it suits the student.
Recommended subject focus areas to improve skills.
Suggested extracurricular activities or mentorship programs in Kenya to explore the field further.""",
)


def get_response(id):

    try:
        # results = Result.objects.filter(student__student__id=id)
        # generate a random result for the student
        results = "Mathematics: 80%, Science: 70%, Social Studies: 50%"
        # generate random interests for the student
        interests = "football, music, technology"
        # generate random practical skills for the student
        practical_skills = "football, music, technology"
        # generate random behavioral and personality traits for the student
        behavioral_traits = "leadership, teamwork, creativity, problem-solving"
        model = genai.GenerativeModel(
            model_name="gemini-2.0-flash",
            generation_config=generation_config,
            system_instruction=f"""Analyze the following student data:
            Academic performance: ({results})
            Practical skills {practical_skills}
            Behavioral and personality traits {behavioral_traits}
            Interests {interests}
            Based on this information and the structure of the Kenyan education system, suggest three potential career pathways that align with the student’s strengths and interests. For each career path, include:
            A brief explanation of why it suits the student.
            Recommended subject focus areas to improve skills.
            Suggested extracurricular activities or mentorship programs in Kenya to explore the field further.""",
        )
        chat_session = model.start_chat(history=[])
        response = chat_session.send_message("generate report")
        return response.text
    except Result.DoesNotExist:
        return {
            "success": False,
            "text": "result for the student does nt exist",
        }


# print(response.text)
