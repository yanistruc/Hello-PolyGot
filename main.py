import subprocess
import platform
from pathlib import Path
import shutil

is_windows = platform.system() == "Windows"

langages_dir = Path("languages")

files = [langages_dir / "hello_python.py"]

def run_command(cmd, description):
    print(f"\033[94m[RUN]\033[0m {description} -> {' '.join(cmd)}")
    subprocess.run(cmd, check=True)

print(f"\033[92m[INFO]\033[0m Running on {'Windows' if is_windows else 'Linux/Mac'}")

for file in files:
    if file.suffix == ".py":
        python_cmd = "python" if is_windows else "python3"
        if shutil.which(python_cmd) is None:
            raise RuntimeError(f"{python_cmd} not found in PATH")
        
        run_command([python_cmd, str(file)], f"Executing {file.name}")
